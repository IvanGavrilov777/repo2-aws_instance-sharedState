terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.63.0"
    }
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "search_for_key_pair" {}

data "terraform_remote_state" "pet-id" {
  backend = "remote"

  config = {
    organization = "ivan-testing"
    workspaces = {
      name = "repo1-randompet-sharedState"
    }
  }
}

resource "aws_instance" "VM" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu.id
  key_name = data.aws_key_pair.search_for_key_pair.key_name
  
  tags = {
  Name = data.terraform_remote_state.pet-id.outputs.petname
  }
}
