#resources
######
# VPC
######
resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support

  tags = merge({
    "Name" = format("%s", var.vpc_name)
  }, var.tags)
}

######
# IGW
######

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge({
    "Name" = format("%s", var.igw_name)
  }, var.tags)
}

######
# PUBLIC SUBNET
######

resource "aws_subnet" "public" {
  count = length(var.subnets_cidr)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true

  tags = merge({
    "Name" = "public_subnet_${count.index+1}",
    "Tier" = "Public"
  }, var.tags)
}

######
# PUBLIC ROUTE TABLE
######

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge({
    "Name" = format("%s", var.rtb_public_name)
  }, var.tags)
}

# Route table association with public subnets

resource "aws_route_table_association" "rtb_association" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_key_pair" "ec2_key" {
  key_name = "development_environment_key"
  public_key = file(var.public_key_path)
}