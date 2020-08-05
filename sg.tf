provider "aws" {
  profile = "default"
  region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpcCIDRblock
  tags = {
     Name = "myvpc"
  }
}

resource "aws_security_group" "mysg" {
   vpc_id = "${aws_vpc.myvpc.id}"
   tags = {
   	Name = "mysq"
   }  
   ingress {
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
      protocol = "tcp"
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
   }
}

resource "aws_instance" "myec2" {
  ami = "ami-01e36b7901e884a10" 
  instance_type = "t2.micro"
  subnet_id = "subnet-02ae2aa3a34fa54f4"
  security_groups = ["sg-02de920853b7a1988"]
}
