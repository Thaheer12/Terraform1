resource "aws_subnet" "publicsubnet" {
  count="${length(var.publicsubnet-cidr)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${element(var.publicsubnet-cidr,count.index)}"

  availability_zone="${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "Wipropublicsubnet-${count.index+1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags {
    Name = "wiproigw"
  }
}
resource "aws_route_table" "customrt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "${var.default-cidr}"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "wiproPublicRt"
  }
}
resource "aws_route_table_association" "association" {
  count="${length(var.publicsubnet-cidr)}"
  subnet_id      = "${aws_subnet.publicsubnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.customrt.id}"
}
