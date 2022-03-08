##security group resource

resource "aws_security_group" "allow" {
  name        = "harshal"
  description = "Allow TLS inbound traffic"
  
  dynamic "ingress" {
    for_each = [22,443,80,3306]
    iterator = port
    content {
          description      = "TLS from VPC"
          from_port        = port.value
          to_port          = port.value
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0"] 
    }
}
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "allow"
  }
}

##instance create

resource "aws_instance" "web" {
  ami           = "ami-0c293f3f676ec4f90"
  instance_type = "t2.micro"
  key_name = "terraform"
  vpc_security_group_ids = ["${aws_security_group.allow.id}"]
  tags = {
    Name = "created by terraform"
  }
}

