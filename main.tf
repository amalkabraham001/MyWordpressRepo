# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
#resource creation
resource "aws_instance" "vm" {
  ami           = "ami-041db4a969fe3eb68" 
  instance_type = "t2.micro"
  key_name = "myawskeypair"

root_block_device {
  encrypted = "true"
  kms_key_id = "872f7005-e042-4f36-9baf-f62e9648ed47"
  volume_size = "20"
  volume_type ="standard"
}
   tags = {
    Owner = "Amal"
    Createdby = "terraform"
  } 


}
