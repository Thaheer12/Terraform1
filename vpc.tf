resource "aws_vpc" "myvpc" {
  cidr_block="${var.vpc-cidr}"

  tags {
    Name = "Wipro-vpc"
    Environment="Dev"
    Companey="Wipro"
  }

}
