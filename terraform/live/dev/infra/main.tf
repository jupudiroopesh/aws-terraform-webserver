locals {
  # Common tags to be assigned to all resources
  owner = "roopesh_jupudi"
  common_tags = {
    Environment = "Development"
    Owner   = local.owner
  }
}

module "web_vpc" {
  source = "../../../modules/network"
  vpc_name = "development_vpc"
  cidr = "10.0.0.0/16"
  igw_name = "development_web_igw"
  rtb_public_name = "development_web_rtb"

  tags = merge(
    local.common_tags,
    map(
      "Cost", "FreeService"
    )
  )
}

module "web_vpc_sg" {
  source			= "../../../modules/security"
  vpc_id			= module.web_vpc.vpc_id
  tags = merge(
    local.common_tags,
    map("Cost", "FreeService")
  )
}

module "web_vpc_instance" {
  source 				= "../../../modules/instance"
  public_subnet_ids = module.web_vpc.public_subnet_ids
  number_of_instances = 3
  vpc_id = module.web_vpc.vpc_id
  key_pair_name = module.web_vpc.ec2_key_name
  security_group_ids = [module.web_vpc_sg.sg_22, module.web_vpc_sg.sg_80]
  user_data = file("install_apache.sh")

  tags = merge(local.common_tags,
    map("Cost", "PaidService",
        "Server", "Web Server"
    )
  )
}


resource "aws_lb_target_group" "web-server-target-group" {
  health_check {
    interval            = 10
    path                = "/index.html"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "dev-web-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = module.web_vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "web-alb-target-group-attachment1" {
  target_group_arn = aws_lb_target_group.web-server-target-group.arn
  target_id        = element(module.web_vpc_instance.public_instances, 0)
  port             = 80
}

resource "aws_lb_target_group_attachment" "web-alb-target-group-attachment2" {
  target_group_arn = aws_lb_target_group.web-server-target-group.arn
  target_id        = element(module.web_vpc_instance.public_instances, 1)
  port             = 80
}

resource "aws_lb_target_group_attachment" "web-alb-target-group-attachment3" {
  target_group_arn = aws_lb_target_group.web-server-target-group.arn
  target_id        = element(module.web_vpc_instance.public_instances, 2)
  port             = 80
}

resource "aws_lb" "web-server-elb" {
  name     = "web-server-elb"
  internal = false
  security_groups = [module.web_vpc_sg.sg_22, module.web_vpc_sg.sg_80]
  subnets = module.web_vpc.public_subnet_ids

  tags = merge(local.common_tags,
    map("Cost", "PaidService",
        "Name", "Web Server ELB")
  )

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "web-alb-listner" {
  load_balancer_arn = aws_lb.web-server-elb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-server-target-group.arn
  }
}