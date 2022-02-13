#--------------------------------------------------------------------------------------
#EP_HM2_Terraform
#
#Web server with user data
#
#------------------------------------------------------

provider "aws" {

}

resource "aws_instance" "AMAZON_Linux" {
  count                  = 1
  ami                    = "ami-0dd555eb7eb3b7c82" # Amazon Linux 2 AMI (HVM) - Kernel 5
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver_ep.id]
  user_data              = file("data.sh")

  tags = {
    Name    = "My Amazon Web Server"
    owner   = "DmitryB"
    project = "EP_HM2_Terraform"
  }
}

resource "aws_security_group" "my_webserver_ep" {
  name        = "sg_webserver_ep"
  description = "web server to HM2"


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # any protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

}
