#internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "custom-internet-gateway"
  }
}

#elastic ip for nat
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
}

#NAT

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = "${aws_subnet.public_subnet.*.id[0]}"

  tags = {
    Name = "NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}




#public subnet RT

resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "public-rt"
  }
}

##route_table_association_with_public_subnet
resource "aws_route_table_association" "association" {
  count          = 2
  subnet_id      = "${aws_subnet.public_subnet.*.id[count.index]}"
  route_table_id = aws_route_table.publicrt.id
}


#private subnet RT

resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "private-rt"
  }
}

##route_table_association_with_private_subnet

resource "aws_route_table_association" "association-1" {
  count          = 2
  subnet_id      = "${aws_subnet.private_subnet.*.id[count.index]}"
  route_table_id = aws_route_table.privatert.id
}


#public route

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.publicrt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}

#private route

resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${aws_route_table.privatert.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}
