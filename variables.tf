variable "region" {
  default     = "us-east-1"
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Enter Instance Type"
  type        = string
}

variable "AMI" {
  default = "ami-052efd3df9dad4825"
  type    = string
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR BLOCK"
  type        = string
}

variable "osp_public_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "public-subnet"
  type        = string
}


 variable "key_name" {
   default = "TF_key"
   type    = string
 }

variable "user_name" {
  default = "DEVOPS_ADMIN"
  type        = string
  description = "The name of the user"
}

variable "instance_name" {
  default = "PROD"
  type        = string
  description = "The name of the instance"
}

variable "vpc_name" {
  default = "main_vpc"
  type        = string
  description = "The name of vpc"
}



variable "gateway_name" {
  default = "main_gtw"
  type        = string
  description = "The name of gateway"
}

variable "route_table_name" {
  default = "main_default_route"
  type        = string
  description = "The name of route table"
}

variable "security_group_name" {
  default = "PROD_ec2_sec.group"
  type        = string
  description = "The name of security group"
}

# variable "resource_bucket_name" {
#  description = "index.html resource bucket name"
#   type = string
#   default = "webhostingterraform112290"
# }

#  variable "resource_bucket_name" {
#   description = "boon db dump sql file"
#    type = string
#    default = "BOONDBDUMPtesting"
#  }

variable "domain_name" {
  default = "levon-arushanyan.acadevopscourse.xyz"
  type = string  

  description = "Domain name"
}

variable "db_domain_name" {
  default = "django-db.levon-arushanyan.acadevopscourse.xyz"
  type = string  

  description = "DB Domain name"
}

variable "ec2_subdomain_name" {
  default = "monitoring.levon-arushanyan.acadevopscourse.xyz"
  type = string  

  description = "EC2 Domain name"
}


variable "hosted_zone_id" {
    
    default = "Z04696121KFQDSPFAMI31"
    description = "Route53 Hosted zone ID for djangoproject website"
}

variable "cluster_name" {
  type        = string
  description = "eks cluster name"
  default     = "Dev_test_cluster"
}

variable "rds_password" {
   type       = string
   description = "DB password"
   default = "Zaq11qaZ%$"
   #sensitive = true 
}