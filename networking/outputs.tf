#---------networking/outputs.tf---------

output "vpc_id" {
  value = aws_vpc.fade_vpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.fade_rds_subnetgroup.*.name
}

output "db_security_group" {
  value = [aws_security_group.fade_sg["rds"].id]
}

output "public_sg" {
  value = aws_security_group.fade_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.fade_public_subnet.*.id
}
