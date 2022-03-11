data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["custom"]
  }
}
data "aws_subnet_ids" "available_db_subnet" {
  vpc_id = data.aws_vpc.vpc_available.id
  filter {
    name   = "tag:Name"
    values = ["private*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


data "aws_security_group" "custom_sg" {
  filter {
    name   = "tag:Name"
    values = ["terraform-custom-sg"]
  }
}