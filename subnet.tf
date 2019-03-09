resource "aws_subnet" "public_subnet" {
	count = "${length(data.aws_availability_zones.azs.names)}"
	availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
	vpc_id = "${aws_vpc.Myvpc.id}"
	cidr_block = "${element(var.public_subnet_cidr,count.index)}"	
	tags {
		Name = "public_subnet-${count.index+1}"
	}
}


resource "aws_subnet" "private_subnet" {
	count = "${length(data.aws_availability_zones.azs.names)}"
	availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
	vpc_id = "${aws_vpc.Myvpc.id}"
	cidr_block = "${element(var.private_subnet_cidr,count.index)}"	
	tags {
		Name = "private_subnet-${count.index+1}"
	}
}
