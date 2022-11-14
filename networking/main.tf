#-----------networking/main.tf--------------------

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "aws_vpc" "fade_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fade_vpc-${random_integer.random.id}"
  }

}

resource "aws_subnet" "fade_public_subnet" {
  count                   = var.public_sn_count
  vpc_id                  = aws_vpc.fade_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]

  tags = {
    Name = "fade_public_${count.index + 1}"
  }
}


resource "aws_subnet" "fade_private_subnet" {
  count                   = var.private_sn_count
  vpc_id                  = aws_vpc.fade_vpc.id
  cidr_block              = var.private_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone       = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]

  tags = {
    Name = "fade_private_${count.index + 1}"
  }
}
