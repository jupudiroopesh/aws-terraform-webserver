output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "public_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.public.*.arn
}

output "ec2_key_name" {
  value = aws_key_pair.ec2_key.key_name
}