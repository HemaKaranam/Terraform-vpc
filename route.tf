#Define the public route table 
resource "aws_route_table" "public_RT" {
	vpc_id = "${aws_vpc.Myvpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.IGW.id}"
		}
	tags {
		Name = "public_RT"
		}
}

#Define private route table
resource "aws_route_table" "private_RT" {
        vpc_id = "${aws_vpc.Myvpc.id}"

        tags {
                Name = "private_RT"
                }
}

