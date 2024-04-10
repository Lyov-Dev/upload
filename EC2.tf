#create ec2 instance
 resource "aws_instance" "PROD_INSTANCE" {
  ami           = var.AMI
  instance_type = var.instance_type #For running on instance some tools change "type" to "t3.large"
  key_name = var.key_name
  iam_instance_profile = aws_iam_instance_profile.EC2_profile.name
  subnet_id = aws_subnet.prod_subnet.id
  vpc_security_group_ids   = [aws_security_group.prod_security_group.id]
  associate_public_ip_address = true
    provisioner "local-exec" {
    command = "echo ${self.public_ip} >> /home/levon/main/ansible/hosts"
  }

  tags = {
    Name = var.instance_name
  }
 }

#OUTPUTS

output "instance_id" {
  value = aws_instance.PROD_INSTANCE.id
}
output "instance_ips" {
  description = "Public IP address "
  value       = aws_instance.PROD_INSTANCE.public_ip 

}

output "vpc_id" {
  value = aws_vpc.main_vpc
}

# output "aws_subnet" {
#   value = aws_subnet.prod_subnet
# }
# output "aws_internet_gateway"  {
#   value = aws_internet_gateway.igw
# }
# output "aws_route_table" {
#   value = aws_route_table.public_route
# }
# output "aws_security_group" {
#   value = aws_security_group.prod_security_group
# }

