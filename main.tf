provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0199ac7c9fbf9ed83"
  instance_type          = "c7i-flex.large"
  key_name               = "junks"
  vpc_security_group_ids = ["sg-003fd9ae7d90334a2 "]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "my-project-bucket-123456789"
  versioning {
    enabled = true
  }
}
