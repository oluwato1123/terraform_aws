#-------------------compute/main.tf-----------------------------

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}


resource "random_id" "fade_node_id" {
  byte_length = 2
  count       = var.instance_count
}



resource "aws_key_pair" "fade_auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "fade_node" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id

  tags = {
    Name = "fade_node_${random_id.fade_node_id[count.index].dec}"
  }

  key_name               = aws_key_pair.fade_auth.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnets[count.index]

  root_block_device {
    volume_size = var.vol_size
  }

}
