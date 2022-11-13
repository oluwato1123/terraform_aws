#---------networking/outputs.tf---------

output "vpc_id" {
  value = aws_vpc.fade_vpc.id
}
