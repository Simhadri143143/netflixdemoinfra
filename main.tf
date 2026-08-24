provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "c7i-flex.large"
  key_name               = "project"
  vpc_security_group_ids = ["sg-045c93bae79aaa0e7"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "subbu143-jenkins-java-bucket-2026" # Unique name to avoid the region/collision error
}

resource "aws_s3_bucket_versioning" "one_versioning" {
  bucket = aws_s3_bucket.one.id

  versioning_configuration {
    status = "Enabled"
  }
}
