resource "aws_instance" "this" {
  ami           = "ami-04681163a08179f28"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]
}

output "instance_id" {
  value = aws_instance.this.id
}
