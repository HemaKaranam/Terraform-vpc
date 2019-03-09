variable "region" {
	default = "us-east-2"
	}
	
variable "vpc_cidr" {
	default = "190.160.0.0/16"
}

variable "public_subnet_cidr" {
	description = "CIDR for public subnet"
	type = "list"
	default = ["190.160.1.0/28","190.160.3.0/28","190.160.5.0/28"]
}

variable "private_subnet_cidr" {
	description = "CIDR for private subnet"
	type = "list"
	default = ["190.160.2.0/28","190.160.4.0/28","190.160.6.0/28"]
}

variable "ami" {
	description = "Redhat Linux"
	default = "ami-0b500ef59d8335eee"
}


#variable "key_path" {
#	descrition = "SSH Public Key path"
#	default = "publick-key"
#}

	
data "aws_availability_zones" "azs" {}

#variable "azs" {
#	type = "list"
#	default = ["us-east-2a","us-east-2b","us-east-2c"]
#}
