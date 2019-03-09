provider "aws" {
        region = "${var.region}"
        access_key = "********************"
        secret_key = "***********************"
}
resource "aws_volume_attachment" "nfs-volume" {
        device_name = "/dev/sdh"
        volume_id   = "${aws_ebs_volume.nfs-volume.id}"
         instance_id = "${aws_instance.drupal-web.id}"

		 }
resource "aws_instance" "drupal-web" {
        ami = "ami-0b500ef59d8335eee"
        instance_type = "t2.micro"
        subnet_id = "${element(aws_subnet.public_subnet.*.id,count.index)}"
        vpc_security_group_ids = ["${aws_security_group.drupal-web-sg.id}"]
        user_data = "${file("/home/ec2-user/terraform-project/drupal-web.sh")}"
        associate_public_ip_address = true
	key_name = "drupal-key"

        tags {
                Name = "drupal-web"
        }
}

resource "aws_ebs_volume" "nfs-volume" {
  availability_zone = "${element(data.aws_availability_zones.azs.names,0)}"
  size   = 1
}






resource "aws_instance" "drupal-MYSQL" {
        ami = "ami-0b500ef59d8335eee"
        instance_type = "t2.micro"
        subnet_id = "${element(aws_subnet.private_subnet.*.id,count.index)}"
        vpc_security_group_ids = ["${aws_security_group.drupal-RDS-sg.id}"]
        user_data = "${file("/home/ec2-user/terraform-project/drupal-RDS.sh")}"

        tags {
                Name = "drupal-MYSQL"
        }
}


