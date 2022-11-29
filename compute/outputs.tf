#---------------compute/outputs.tf---------------------

output "instance" {
  value     = aws_instance.fade_node[*]
  sensitive = true
}
