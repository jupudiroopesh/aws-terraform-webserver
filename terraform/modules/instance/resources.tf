resource "aws_instance" "public_instance" {
  count = var.number_of_instances
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id =  element(var.public_subnet_ids, count.index)
  vpc_security_group_ids = var.security_group_ids
  key_name = var.key_pair_name
  user_data = var.user_data

  tags = merge({
    Name = "public_instance_${count.index}",
    Tier = "public"
  }, var.tags)
}
