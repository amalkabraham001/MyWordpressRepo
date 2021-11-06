# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
#resource creation
resource "aws_instance" "vm1" {
  ami           = "ami-041db4a969fe3eb68" 
  instance_type = "t2.micro"
  key_name = "myawskeypair"
tags = {
    Owner = "Amal"
    Createdby = "terraform"
  } 

root_block_device {
  encrypted = "true"
  volume_size = "20"
  volume_type ="standard"
}
}
 

