
#vpc create

resource "aws_vpc" "custom" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "custom"
  }
}

## public subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.0.0/17"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public"
  }
}

#private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.128.0/17"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private"
  }
}
