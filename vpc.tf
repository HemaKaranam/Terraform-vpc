#Define VPC
resource "aws_vpc" "Myvpc" {
	cidr_block = "${var.vpc_cidr}"
	instance_tenancy = "default"
	
	tags {
	Name = "Myvpc"
	}
}
