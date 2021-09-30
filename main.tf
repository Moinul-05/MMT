# Provider 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.60.0"
    }
  }
}
# Region 
provider "aws" {
    region = "eu-west-2"  
}

# VPC and cider block
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        name = "MMT-Challange"
    }
  
}
# Subnet creation with the availability zone
resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.availability_zone

    tags = {
        Name = "VPC_subnet"
    }
  
}

# eip 
resource "aws_eip" "elasticip" {
    instance = aws_instance.ec2.id
  
}
# instcance creation
resource "aws_instance" "ec2" {
    ami = var.ami[var.region]
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet1.id 
}