provider "aws" {
  region     = "ap-southeast-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0cbc6aae997c6538a" # AMI for free eligible
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_8088.name}"]
}
# Tạo resource aws_security_group và allow_8088 và khai báo tham chiếu trên resource của aws_instance ${aws_security_group.allow_8088.name}

resource "aws_security_group" "allow_8088" {
  name = "allow_ssh"
  # SSH access
  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
