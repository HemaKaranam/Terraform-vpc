#Creating Security group for pubic route

resource "aws_security_group" "Myfirewall-sg" {
	name = "Myfirewall-sg"
	description = "The security Group for bastion"
	vpc_id = "${aws_vpc.Myvpc.id}"


	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks =  ["0.0.0.0/0"]
		}
		
	egress {
	  from_port = 0
          to_port = 0
          protocol = "-1"
          cidr_blocks =  ["0.0.0.0/0"]
          }


	tags {
    Name = "Myfirewall-sg"
}
}

 
resource "aws_security_group"  "drupal-web-sg" {
		name = "drupal-web-sg"
                description = "The security Group for drupal-web"
        	vpc_id = "${aws_vpc.Myvpc.id}"


		ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		security_groups = ["${aws_security_group.Myfirewall-sg.id}"]
		}
		
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks =  ["0.0.0.0/0"]
		
	}
	
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
              }

	tags {
		Name = "drupal-web-sg"
	}
}




resource "aws_security_group"  "drupal-RDS-sg" {
		name = "drupal-RDS-sg"
                description = "The security Group for drupal-RDS"
                vpc_id = "${aws_vpc.Myvpc.id}"

		 ingress {
                from_port = 3306
                to_port = 3306
                protocol = "tcp"
                security_groups = ["${aws_security_group.drupal-web-sg.id}"]
                }

        ingress {
                from_port = 2049
                to_port = 2049
                protocol = "tcp"
                cidr_blocks =  ["0.0.0.0/0"]

        }

        egress {
                from_port   = 0
                to_port     = 0
                protocol    = "-1"
                cidr_blocks = ["0.0.0.0/0"]
              }

        tags {
                Name = "drupal-RDS-sg"
        }
}

