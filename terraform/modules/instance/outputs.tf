output "public_instances" {
  value = aws_instance.public_instance.*.id
}

