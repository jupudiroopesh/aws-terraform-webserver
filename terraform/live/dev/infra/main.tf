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
    map("Cost", "PaidService")
  )
}

resource "aws_elb" "terra-elb" {
  name               = "terra-elb"
  subnets = module.web_vpc.public_subnet_ids
  security_groups = [module.web_vpc_sg.sg_22, module.web_vpc_sg.sg_80]

  depends_on = [module.web_vpc, module.web_vpc_instance]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances = module.web_vpc_instance.public_instances
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = merge(local.common_tags,
  map("Cost", "PaidService")
  )
}