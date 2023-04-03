data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["harshal-vpc"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
