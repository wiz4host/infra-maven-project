resource "aws_instance" "infra_aks" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance_types[var.environment]
  monitoring             = true
  vpc_security_group_ids = var.security_groups
  tags          = {
    Name        = "${var.environment}-ec2-infra_aks"
    Environment = var.environment
  }
  root_block_device {
    delete_on_termination = true
  }
}

output "ec2-id" {
  value = aws_instance.infra_aks.id
}