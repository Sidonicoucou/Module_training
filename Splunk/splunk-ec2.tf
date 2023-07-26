#variable "aws_security_group" {}


data "aws_security_group" "test" {
  #id = var.aws_security_group
  
  filter {
    #name = "tag:Name"
    name = "Security group name"
    values = ["SPlunk_SG"]
  }
}



resource "aws_instance" "splunk" {
  ami           = "ami-04823729c75214919"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = ["data.aws_security_group.test.id"] 
  key_name = ""

  tags = {
    Name = "splunk"
  }
}
