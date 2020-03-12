output "web_vpc" {
  value = module.web_vpc
}

output "web_vpc_sg" {
  value = module.web_vpc_sg
}

output "web_vpc_instance" {
  value = module.web_vpc_instance
}

output "elb-dns-name" {
  value = aws_elb.terra-elb.dns_name
}