
#vpc create

resource "aws_vpc" "custom" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "custom"
  }
}

## public subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom.id
  count    = 2
  cidr_block = "${var.public_cidrs[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public-subnet.${count.index + 1}"
  }
}

#private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.custom.id
  count    = 2
  cidr_block = "${var.private_cidrs[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private-subnet.${count.index + 1}"
  }
}
