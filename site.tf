provider "aws" {
  region     = "ap-southeast-2"
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
}

variable "aws_access_key_id" {
  type = "string"
#   default = "xxxxxxxxxxxxxxxxxxxx"
}

variable "aws_secret_access_key" {
  type = "string"
#   default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "bucket_name" {
  type = "string"
#   default = "xxxxxxxxxxxxxxxxxxxxxxxx"
}

#variable "mydata" {
#  type = "string"
#
locals {
mydata = <<EOF
#!/bin/bash
sudo curl http://169.254.169.254/latest/meta-data/hostname > /tmp/index.html 
sudo yum install httpd -y
sudo cp /tmp/index.html /var/www/html/index.html
sudo service httpd start
sudo aws s3 cp /tmp/index.html ${var.bucket_name}
EOF
}

resource "aws_iam_role" "ec2-role" {
  name = "ec2-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2-role" {
  name = "ec2-role"
  role = "${aws_iam_role.ec2-role.name}"
}

resource "aws_iam_role_policy" "ec2-role-policy" {
  name = "ec2-role-policy"
  role = "${aws_iam_role.ec2-role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
  ]
}
EOF
}

resource "aws_launch_configuration" "Free-Tire-Amazon-Linux-2018" {
  name_prefix          = "Free-Tire-Amazon-Linux-2018"
  image_id             = "ami-09b42976632b27e9b"
  instance_type        = "t2.micro"
  user_data            = "${local.mydata}"
  key_name             = "MyEC2KeyPair"
  iam_instance_profile = "${aws_iam_instance_profile.ec2-role.name}"
}

resource "aws_autoscaling_group" "terrafor-autoscaling-grp" {
  availability_zones    = ["ap-southeast-2a"]
  desired_capacity      = "1"
  max_size              = "2"
  min_size              = "1"
  launch_configuration  = "${aws_launch_configuration.Free-Tire-Amazon-Linux-2018.name}"
  protect_from_scale_in = "true"

  initial_lifecycle_hook {
    name                 = "ec2-instance-initial"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  }
}
