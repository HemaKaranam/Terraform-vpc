resource "aws_eip" "drupal-eip" {
  lifecycle {
    create_before_destroy = true
}
}
resource "aws_nat_gateway" "drupal-nat" {
  allocation_id = "${aws_eip.drupal-eip.id}"
  subnet_id     = "${element(aws_subnet.private_subnet.*.id,0)}"
  
	tags {
		Name = "drupal-nat"
	}
}
