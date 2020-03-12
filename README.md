# aws-terraform-webserver

```H-053:roopesh_aws Roopesh.Jupudi$ git clone https://github.com/jupudiroopesh/aws-terraform-webserver.git
Cloning into 'aws-terraform-webserver'...
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 26 (delta 0), reused 26 (delta 0), pack-reused 0
Unpacking objects: 100% (26/26), done.
H-053:roopesh_aws Roopesh.Jupudi$ ls
aws-ip-ranges		aws-terraform-webserver	backup_before_github
H-053:roopesh_aws Roopesh.Jupudi$ cd aws-terraform-webserver/
H-053:aws-terraform-webserver Roopesh.Jupudi$ ls
README.md	terraform
H-053:aws-terraform-webserver Roopesh.Jupudi$ cd terraform/live/dev/infra/
H-053:infra Roopesh.Jupudi$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_lb.web-server-elb will be created
  + resource "aws_lb" "web-server-elb" {
      + arn                        = (known after apply)
      + arn_suffix                 = (known after apply)
      + dns_name                   = (known after apply)
      + enable_deletion_protection = false
      + enable_http2               = true
      + id                         = (known after apply)
      + idle_timeout               = 60
      + internal                   = false
      + ip_address_type            = "ipv4"
      + load_balancer_type         = "application"
      + name                       = "web-server-elb"
      + security_groups            = (known after apply)
      + subnets                    = (known after apply)
      + tags                       = {
          + "Cost"        = "PaidService"
          + "Environment" = "Development"
          + "Name"        = "Web Server ELB"
          + "Owner"       = "roopesh_jupudi"
        }
      + vpc_id                     = (known after apply)
      + zone_id                    = (known after apply)

      + subnet_mapping {
          + allocation_id = (known after apply)
          + subnet_id     = (known after apply)
        }
    }

  # aws_lb_listener.web-alb-listner will be created
  + resource "aws_lb_listener" "web-alb-listner" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_target_group.web-server-target-group will be created
  + resource "aws_lb_target_group" "web-server-target-group" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + deregistration_delay               = 300
      + id                                 = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancing_algorithm_type      = (known after apply)
      + name                               = "dev-web-tg"
      + port                               = 80
      + protocol                           = "HTTP"
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 5
          + interval            = 10
          + matcher             = (known after apply)
          + path                = "/index.html"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = 5
          + unhealthy_threshold = 2
        }

      + stickiness {
          + cookie_duration = (known after apply)
          + enabled         = (known after apply)
          + type            = (known after apply)
        }
    }

  # aws_lb_target_group_attachment.web-alb-target-group-attachment1 will be created
  + resource "aws_lb_target_group_attachment" "web-alb-target-group-attachment1" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_lb_target_group_attachment.web-alb-target-group-attachment2 will be created
  + resource "aws_lb_target_group_attachment" "web-alb-target-group-attachment2" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_lb_target_group_attachment.web-alb-target-group-attachment3 will be created
  + resource "aws_lb_target_group_attachment" "web-alb-target-group-attachment3" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # module.web_vpc.aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "development_web_igw"
          + "Owner"       = "roopesh_jupudi"
        }
      + vpc_id   = (known after apply)
    }

  # module.web_vpc.aws_key_pair.ec2_key will be created
  + resource "aws_key_pair" "ec2_key" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "development_environment_key"
      + key_pair_id = (known after apply)
      + public_key  = "ssh-rsa 4Q== roopesh.jupudi@xx.co.nz"
    }

  # module.web_vpc.aws_route_table.rtb_public will be created
  + resource "aws_route_table" "rtb_public" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "development_web_rtb"
          + "Owner"       = "roopesh_jupudi"
        }
      + vpc_id           = (known after apply)
    }

  # module.web_vpc.aws_route_table_association.rtb_association[0] will be created
  + resource "aws_route_table_association" "rtb_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.web_vpc.aws_route_table_association.rtb_association[1] will be created
  + resource "aws_route_table_association" "rtb_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.web_vpc.aws_route_table_association.rtb_association[2] will be created
  + resource "aws_route_table_association" "rtb_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.web_vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "public_subnet_1"
          + "Owner"       = "roopesh_jupudi"
          + "Tier"        = "Public"
        }
      + vpc_id                          = (known after apply)
    }

  # module.web_vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.2.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "public_subnet_2"
          + "Owner"       = "roopesh_jupudi"
          + "Tier"        = "Public"
        }
      + vpc_id                          = (known after apply)
    }

  # module.web_vpc.aws_subnet.public[2] will be created
  + resource "aws_subnet" "public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1c"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.3.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "public_subnet_3"
          + "Owner"       = "roopesh_jupudi"
          + "Tier"        = "Public"
        }
      + vpc_id                          = (known after apply)
    }

  # module.web_vpc.aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "development_vpc"
          + "Owner"       = "roopesh_jupudi"
        }
    }

  # module.web_vpc_instance.aws_instance.public_instance[0] will be created
  + resource "aws_instance" "public_instance" {
      + ami                          = "ami-0e2ff28bfb72a4e45"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "development_environment_key"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Cost"        = "PaidService"
          + "Environment" = "Development"
          + "Name"        = "public_instance_0"
          + "Owner"       = "roopesh_jupudi"
          + "Server"      = "Web Server"
          + "Tier"        = "public"
        }
      + tenancy                      = (known after apply)
      + user_data                    = "2ec303c069dc3d418f17d5273ee670e30ad38718"
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # module.web_vpc_instance.aws_instance.public_instance[1] will be created
  + resource "aws_instance" "public_instance" {
      + ami                          = "ami-0e2ff28bfb72a4e45"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "development_environment_key"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Cost"        = "PaidService"
          + "Environment" = "Development"
          + "Name"        = "public_instance_1"
          + "Owner"       = "roopesh_jupudi"
          + "Server"      = "Web Server"
          + "Tier"        = "public"
        }
      + tenancy                      = (known after apply)
      + user_data                    = "2ec303c069dc3d418f17d5273ee670e30ad38718"
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # module.web_vpc_instance.aws_instance.public_instance[2] will be created
  + resource "aws_instance" "public_instance" {
      + ami                          = "ami-0e2ff28bfb72a4e45"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "development_environment_key"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Cost"        = "PaidService"
          + "Environment" = "Development"
          + "Name"        = "public_instance_2"
          + "Owner"       = "roopesh_jupudi"
          + "Server"      = "Web Server"
          + "Tier"        = "public"
        }
      + tenancy                      = (known after apply)
      + user_data                    = "2ec303c069dc3d418f17d5273ee670e30ad38718"
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # module.web_vpc_sg.aws_security_group.sg_22 will be created
  + resource "aws_security_group" "sg_22" {
      + arn                    = (known after apply)
      + description            = "allow_ssh"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "sg_22"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "sg_22"
          + "Owner"       = "roopesh_jupudi"
        }
      + vpc_id                 = (known after apply)
    }

  # module.web_vpc_sg.aws_security_group.sg_80 will be created
  + resource "aws_security_group" "sg_80" {
      + arn                    = (known after apply)
      + description            = "allow_http"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "sg_80"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Cost"        = "FreeService"
          + "Environment" = "Development"
          + "Name"        = "sg_80"
          + "Owner"       = "roopesh_jupudi"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 21 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.web_vpc.aws_key_pair.ec2_key: Creating...
module.web_vpc.aws_vpc.vpc: Creating...
module.web_vpc.aws_key_pair.ec2_key: Creation complete after 2s [id=development_environment_key]
module.web_vpc.aws_vpc.vpc: Still creating... [10s elapsed]
module.web_vpc.aws_vpc.vpc: Creation complete after 13s [id=vpc-0cfcb95d8bca48dd1]
module.web_vpc.aws_internet_gateway.igw: Creating...
module.web_vpc.aws_subnet.public[1]: Creating...
module.web_vpc.aws_subnet.public[2]: Creating...
module.web_vpc.aws_subnet.public[0]: Creating...
module.web_vpc_sg.aws_security_group.sg_22: Creating...
aws_lb_target_group.web-server-target-group: Creating...
module.web_vpc_sg.aws_security_group.sg_80: Creating...
module.web_vpc.aws_subnet.public[0]: Creation complete after 5s [id=subnet-092f1c41c3b2c50d4]
module.web_vpc.aws_subnet.public[2]: Creation complete after 5s [id=subnet-0ff8450508464efa1]
module.web_vpc.aws_subnet.public[1]: Creation complete after 5s [id=subnet-04f97e6fe3100e801]
module.web_vpc.aws_internet_gateway.igw: Creation complete after 6s [id=igw-0fc12467287ab2700]
module.web_vpc.aws_route_table.rtb_public: Creating...
aws_lb_target_group.web-server-target-group: Creation complete after 6s [id=arn:aws:elasticloadbalancing:us-east-1:653187930837:targetgroup/dev-web-tg/2949bff1fe978677]
module.web_vpc_sg.aws_security_group.sg_22: Creation complete after 9s [id=sg-0d5e81178e5e1be29]
module.web_vpc_sg.aws_security_group.sg_80: Creation complete after 9s [id=sg-00f2fda60988c07d9]
aws_lb.web-server-elb: Creating...
module.web_vpc_instance.aws_instance.public_instance[1]: Creating...
module.web_vpc_instance.aws_instance.public_instance[0]: Creating...
module.web_vpc_instance.aws_instance.public_instance[2]: Creating...
module.web_vpc.aws_route_table.rtb_public: Creation complete after 4s [id=rtb-0803d1cb6560a1070]
module.web_vpc.aws_route_table_association.rtb_association[2]: Creating...
module.web_vpc.aws_route_table_association.rtb_association[1]: Creating...
module.web_vpc.aws_route_table_association.rtb_association[0]: Creating...
module.web_vpc.aws_route_table_association.rtb_association[2]: Creation complete after 1s [id=rtbassoc-016ddf382e9a98a47]
module.web_vpc.aws_route_table_association.rtb_association[0]: Creation complete after 1s [id=rtbassoc-06067597d0628b2a8]
module.web_vpc.aws_route_table_association.rtb_association[1]: Creation complete after 1s [id=rtbassoc-0978416b32ded2fb1]
aws_lb.web-server-elb: Still creating... [10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [10s elapsed]
aws_lb.web-server-elb: Still creating... [20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [20s elapsed]
aws_lb.web-server-elb: Still creating... [30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [30s elapsed]
aws_lb.web-server-elb: Still creating... [40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Creation complete after 42s [id=i-04e1b16935013644d]
module.web_vpc_instance.aws_instance.public_instance[1]: Creation complete after 42s [id=i-04b4a1048ca90dd4d]
module.web_vpc_instance.aws_instance.public_instance[0]: Creation complete after 43s [id=i-07c8aa15348ff3fae]
aws_lb_target_group_attachment.web-alb-target-group-attachment1: Creating...
aws_lb_target_group_attachment.web-alb-target-group-attachment3: Creating...
aws_lb_target_group_attachment.web-alb-target-group-attachment2: Creating...
aws_lb_target_group_attachment.web-alb-target-group-attachment3: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-east-1:653187930837:targetgroup/dev-web-tg/2949bff1fe978677-20200312062936665100000001]
aws_lb_target_group_attachment.web-alb-target-group-attachment1: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-east-1:653187930837:targetgroup/dev-web-tg/2949bff1fe978677-20200312062936720100000002]
aws_lb_target_group_attachment.web-alb-target-group-attachment2: Creation complete after 1s [id=arn:aws:elasticloadbalancing:us-east-1:653187930837:targetgroup/dev-web-tg/2949bff1fe978677-20200312062936743100000003]
aws_lb.web-server-elb: Still creating... [50s elapsed]
aws_lb.web-server-elb: Still creating... [1m0s elapsed]
aws_lb.web-server-elb: Still creating... [1m10s elapsed]
aws_lb.web-server-elb: Still creating... [1m20s elapsed]
aws_lb.web-server-elb: Still creating... [1m30s elapsed]
aws_lb.web-server-elb: Still creating... [1m40s elapsed]
aws_lb.web-server-elb: Still creating... [1m50s elapsed]
aws_lb.web-server-elb: Still creating... [2m0s elapsed]
aws_lb.web-server-elb: Still creating... [2m10s elapsed]
aws_lb.web-server-elb: Still creating... [2m20s elapsed]
aws_lb.web-server-elb: Still creating... [2m30s elapsed]
aws_lb.web-server-elb: Still creating... [2m40s elapsed]
aws_lb.web-server-elb: Still creating... [2m50s elapsed]
aws_lb.web-server-elb: Still creating... [3m0s elapsed]
aws_lb.web-server-elb: Still creating... [3m10s elapsed]
aws_lb.web-server-elb: Still creating... [3m20s elapsed]
aws_lb.web-server-elb: Still creating... [3m30s elapsed]
aws_lb.web-server-elb: Creation complete after 3m34s [id=arn:aws:elasticloadbalancing:us-east-1:653187930837:loadbalancer/app/web-server-elb/90a8948dbf6d4c37]
aws_lb_listener.web-alb-listner: Creating...
aws_lb_listener.web-alb-listner: Creation complete after 2s [id=arn:aws:elasticloadbalancing:us-east-1:653187930837:listener/app/web-server-elb/90a8948dbf6d4c37/7476a3bdfd0fafc3]

Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

Outputs:

web-elb-dns-name = web-server-elb-306326944.us-east-1.elb.amazonaws.com
web_vpc = {
  "ec2_key_name" = "development_environment_key"
  "public_subnet_arns" = [
    "arn:aws:ec2:us-east-1:653187930837:subnet/subnet-092f1c41c3b2c50d4",
    "arn:aws:ec2:us-east-1:653187930837:subnet/subnet-04f97e6fe3100e801",
    "arn:aws:ec2:us-east-1:653187930837:subnet/subnet-0ff8450508464efa1",
  ]
  "public_subnet_ids" = [
    "subnet-092f1c41c3b2c50d4",
    "subnet-04f97e6fe3100e801",
    "subnet-0ff8450508464efa1",
  ]
  "vpc_id" = "vpc-0cfcb95d8bca48dd1"
}
web_vpc_instance = {
  "public_instances" = [
    "i-07c8aa15348ff3fae",
    "i-04b4a1048ca90dd4d",
    "i-04e1b16935013644d",
  ]
}
web_vpc_sg = {
  "sg_22" = "sg-0d5e81178e5e1be29"
  "sg_80" = "sg-00f2fda60988c07d9"
}
H-053:infra Roopesh.Jupudi$
```
