resource "aws_subnet" "privatesubnet" {
  count="${length(var.privatesubnet-cidr)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${element(var.privatesubnet-cidr,count.index)}"

  availability_zone="${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "Wiproprivatesubnet-${count.index+1}"
  }
}

resource "aws_default_route_table" "defaultrt1" {
  default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"

  route {
    cidr_block = "${var.default-cidr}"
    instance_id = "${aws_instance.nat.id}"
  }

  tags {
    Name = "WiproPrivateRt"
  }
}
resource "aws_route_table_association" "association1" {
  count="${length(var.privatesubnet-cidr)}"
  subnet_id      = "${aws_subnet.privatesubnet.*.id[count.index]}"
  route_table_id = "${aws_default_route_table.defaultrt1.id}"
}
