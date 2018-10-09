  resource "aws_instance" "private" {
  count="${var.numberofprivate}"
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id="${aws_subnet.privatesubnet.*.id[count.index]}"
  associate_public_ip_address=false
  vpc_security_group_ids=["${aws_security_group.allow_all.id}"]
  key_name="${var.keyname}"

  tags {
    Name = "PrivateInstance-${count.index+1}"
  }
}
