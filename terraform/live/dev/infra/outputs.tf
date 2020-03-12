output "web_vpc" {
  value = module.web_vpc
}

output "web_vpc_sg" {
  value = module.web_vpc_sg
}

output "web_vpc_instance" {
  value = module.web_vpc_instance
}

output "web-elb-dns-name" {
  value = aws_lb.web-server-elb.dns_name
}