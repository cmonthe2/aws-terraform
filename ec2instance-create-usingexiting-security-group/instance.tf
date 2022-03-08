resource "aws_instance" "web" {
  ami           = "ami-0c293f3f676ec4f90"
  instance_type = "t2.micro"
  key_name = "terraform"
  security_groups = [ "terrafrom-sg" ]
  tags = {
    Name = "created by terraform"
  }
}

