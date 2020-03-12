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
H-053:infra Roopesh.Jupudi$ terraform init
Initializing modules...
- web_vpc in ../../../modules/network
- web_vpc_instance in ../../../modules/instance
- web_vpc_sg in ../../../modules/security

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.52.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.52"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
H-053:infra Roopesh.Jupudi$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_elb.terra-elb will be created
  + resource "aws_elb" "terra-elb" {
      + arn                         = (known after apply)
      + availability_zones          = (known after apply)
      + connection_draining         = true
      + connection_draining_timeout = 300
      + cross_zone_load_balancing   = true
      + dns_name                    = (known after apply)
      + id                          = (known after apply)
      + idle_timeout                = 100
      + instances                   = (known after apply)
      + internal                    = (known after apply)
      + name                        = "terra-elb"
      + security_groups             = (known after apply)
      + source_security_group       = (known after apply)
      + source_security_group_id    = (known after apply)
      + subnets                     = (known after apply)
      + tags                        = {
          + "Cost"        = "PaidService"
          + "Environment" = "Development"
          + "Owner"       = "roopesh_jupudi"
        }
      + zone_id                     = (known after apply)

      + health_check {
          + healthy_threshold   = 2
          + interval            = 30
          + target              = "HTTP:80/index.html"
          + timeout             = 3
          + unhealthy_threshold = 2
        }

      + listener {
          + instance_port     = 80
          + instance_protocol = "http"
          + lb_port           = 80
          + lb_protocol       = "http"
        }
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
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDJddVdH5T+ZffBv6A7X5g7/rsqK3vrmDbyQAjR6IdeaC7+6ixy6hGgraNwcpj072yRrPimGXCyABEtse4a4TjAva2qMTyBcgd08WMtEdA+LXjICsniH2lKk/DPsoJPQMr3kvYX3Sqn70Jtmhla25CWxon73/4w1EsjkEqc/ezsee9f6ijENmEwemVSxKkgqNzAqjAd6j/qgw5j/G+8Lo37iV3UMQ76/CI87WYs4cOav9SBO2e34YMC7p8XNxcBegcwz0f/mwf7xDVjdYRs58zbZ8YEZW2Ya8nnbXlxI1NBgQiYoB8cFEv7rqfHe92SGWanDrYF/fBme4B0xYNp6yszIouFBC4CZg3vWETE0KSfkPdcf+888qmHZ01iI8TFu3+9h0wYceLwrlBFbLThZsYEvootxBgY+1T3fwjKVbUTMM8YkD19ofMUvNQqB3DLczFKTwCAzx6OuzkQSabatL6k3Jfv3cW8DE2SA5HEyq+gATtlNXbCjgC9nhw+v1uMflRjQnlHJsawRKZk/FgK9dvDiLg1EmDSptQPw9d/t+K3+mcez+kz48eyIy/4o2HXY74Wn5YAgn2u7oSApl1lgXr01rndI/dUuSwMTqSX/uJxNc0ERP+HG25GAiV0HAjyJeUbJmPjTgZAw+q/t0K3SVU6NcRdKC/qEpyKHL7hX/U4Q== roopesh.jupudi@harmoney.co.nz"
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

Plan: 16 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

H-053:infra Roopesh.Jupudi$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_elb.terra-elb will be created
  + resource "aws_elb" "terra-elb" {
      + arn                         = (known after apply)
      + availability_zones          = (known after apply)
      + connection_draining         = true
      + connection_draining_timeout = 300
      + cross_zone_load_balancing   = true
      + dns_name                    = (known after apply)
      + id                          = (known after apply)
      + idle_timeout                = 100
      + instances                   = (known after apply)
      + internal                    = (known after apply)
      + name                        = "terra-elb"
      + security_groups             = (known after apply)
      + source_security_group       = (known after apply)
      + source_security_group_id    = (known after apply)
      + subnets                     = (known after apply)
      + tags                        = {
          + "Cost"        = "PaidService"
          + "Environment" = "Development"
          + "Owner"       = "roopesh_jupudi"
        }
      + zone_id                     = (known after apply)

      + health_check {
          + healthy_threshold   = 2
          + interval            = 30
          + target              = "HTTP:80/index.html"
          + timeout             = 3
          + unhealthy_threshold = 2
        }

      + listener {
          + instance_port     = 80
          + instance_protocol = "http"
          + lb_port           = 80
          + lb_protocol       = "http"
        }
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
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDJddVdH5T+ZffBv6A7X5g7/rsqK3vrmDbyQAjR6IdeaC7+6ixy6hGgraNwcpj072yRrPimGXCyABEtse4a4TjAva2qMTyBcgd08WMtEdA+LXjICsniH2lKk/DPsoJPQMr3kvYX3Sqn70Jtmhla25CWxon73/4w1EsjkEqc/ezsee9f6ijENmEwemVSxKkgqNzAqjAd6j/qgw5j/G+8Lo37iV3UMQ76/CI87WYs4cOav9SBO2e34YMC7p8XNxcBegcwz0f/mwf7xDVjdYRs58zbZ8YEZW2Ya8nnbXlxI1NBgQiYoB8cFEv7rqfHe92SGWanDrYF/fBme4B0xYNp6yszIouFBC4CZg3vWETE0KSfkPdcf+888qmHZ01iI8TFu3+9h0wYceLwrlBFbLThZsYEvootxBgY+1T3fwjKVbUTMM8YkD19ofMUvNQqB3DLczFKTwCAzx6OuzkQSabatL6k3Jfv3cW8DE2SA5HEyq+gATtlNXbCjgC9nhw+v1uMflRjQnlHJsawRKZk/FgK9dvDiLg1EmDSptQPw9d/t+K3+mcez+kz48eyIy/4o2HXY74Wn5YAgn2u7oSApl1lgXr01rndI/dUuSwMTqSX/uJxNc0ERP+HG25GAiV0HAjyJeUbJmPjTgZAw+q/t0K3SVU6NcRdKC/qEpyKHL7hX/U4Q== roopesh.jupudi@harmoney.co.nz"
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

Plan: 16 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.web_vpc.aws_vpc.vpc: Creating...
module.web_vpc.aws_key_pair.ec2_key: Creating...
module.web_vpc.aws_key_pair.ec2_key: Creation complete after 2s [id=development_environment_key]
module.web_vpc.aws_vpc.vpc: Still creating... [10s elapsed]
module.web_vpc.aws_vpc.vpc: Creation complete after 12s [id=vpc-098ab70747345ce9d]
module.web_vpc.aws_internet_gateway.igw: Creating...
module.web_vpc.aws_subnet.public[2]: Creating...
module.web_vpc.aws_subnet.public[1]: Creating...
module.web_vpc.aws_subnet.public[0]: Creating...
module.web_vpc_sg.aws_security_group.sg_80: Creating...
module.web_vpc_sg.aws_security_group.sg_22: Creating...
module.web_vpc.aws_subnet.public[0]: Creation complete after 5s [id=subnet-0b574c7e7acb4c205]
module.web_vpc.aws_subnet.public[2]: Creation complete after 5s [id=subnet-09c6a15423038a3dd]
module.web_vpc.aws_subnet.public[1]: Creation complete after 5s [id=subnet-0fdaabab797d77f03]
module.web_vpc.aws_internet_gateway.igw: Creation complete after 5s [id=igw-0e505dc40a0c06ae2]
module.web_vpc.aws_route_table.rtb_public: Creating...
module.web_vpc_sg.aws_security_group.sg_22: Creation complete after 8s [id=sg-0a209dfdc655d5575]
module.web_vpc_sg.aws_security_group.sg_80: Creation complete after 8s [id=sg-0cca0691bf19da766]
module.web_vpc_instance.aws_instance.public_instance[1]: Creating...
module.web_vpc_instance.aws_instance.public_instance[2]: Creating...
module.web_vpc_instance.aws_instance.public_instance[0]: Creating...
module.web_vpc.aws_route_table.rtb_public: Creation complete after 5s [id=rtb-0dd5beb247d713619]
module.web_vpc.aws_route_table_association.rtb_association[0]: Creating...
module.web_vpc.aws_route_table_association.rtb_association[2]: Creating...
module.web_vpc.aws_route_table_association.rtb_association[1]: Creating...
module.web_vpc.aws_route_table_association.rtb_association[0]: Creation complete after 1s [id=rtbassoc-09f1da59111055ca7]
module.web_vpc.aws_route_table_association.rtb_association[1]: Creation complete after 1s [id=rtbassoc-0b4b0933bfbe63807]
module.web_vpc.aws_route_table_association.rtb_association[2]: Creation complete after 1s [id=rtbassoc-0134ea211a261db6e]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Still creating... [30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[1]: Creation complete after 31s [id=i-076c4ab6dfe3f65f7]
module.web_vpc_instance.aws_instance.public_instance[2]: Still creating... [40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[2]: Creation complete after 43s [id=i-0c65889502e7f4e85]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [50s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [1m0s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [1m10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [1m20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [1m30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [1m40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [1m50s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [2m0s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [2m10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [2m20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [2m30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [2m40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [2m50s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [3m0s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [3m10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [3m20s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [3m30s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [3m40s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [3m50s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [4m0s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Still creating... [4m10s elapsed]
module.web_vpc_instance.aws_instance.public_instance[0]: Creation complete after 4m11s [id=i-04e04dd7163724cd1]
aws_elb.terra-elb: Creating...
aws_elb.terra-elb: Still creating... [10s elapsed]
aws_elb.terra-elb: Creation complete after 16s [id=terra-elb]

Apply complete! Resources: 16 added, 0 changed, 0 destroyed.

Outputs:

elb-dns-name = terra-elb-1031814988.us-east-1.elb.amazonaws.com
web_vpc = {
  "ec2_key_name" = "development_environment_key"
  "public_subnet_arns" = [
    "arn:aws:ec2:us-east-1:653187930837:subnet/subnet-0b574c7e7acb4c205",
    "arn:aws:ec2:us-east-1:653187930837:subnet/subnet-0fdaabab797d77f03",
    "arn:aws:ec2:us-east-1:653187930837:subnet/subnet-09c6a15423038a3dd",
  ]
  "public_subnet_ids" = [
    "subnet-0b574c7e7acb4c205",
    "subnet-0fdaabab797d77f03",
    "subnet-09c6a15423038a3dd",
  ]
  "vpc_id" = "vpc-098ab70747345ce9d"
}
web_vpc_instance = {
  "public_instances" = [
    "i-04e04dd7163724cd1",
    "i-076c4ab6dfe3f65f7",
    "i-0c65889502e7f4e85",
  ]
}
web_vpc_sg = {
  "sg_22" = "sg-0a209dfdc655d5575"
  "sg_80" = "sg-0cca0691bf19da766"
}

```
