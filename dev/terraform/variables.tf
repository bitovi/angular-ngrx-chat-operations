variable "app_repo_clone_url" {
  type = string
  description = "GitHub Repo full url of the app to clone"
}
variable "app_repo_name" {
  type = string
  description = "GitHub Repo Name"
}

variable "app_install_root" {
  type = string
  description = "Path on the instance where the app will be cloned (do not include app_repo_name)."
  default = "/home/ubuntu"
}
variable "os_system_user" {
  type = string
  description = "User for the OS"
  default = "ubuntu"
}

variable "ops_repo_environment" {
  type = string
  description = "Ops Repo Environment (i.e. directory name)"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.small"
  description = "Instance type for the EC2 instance"
}
variable "security_group_name" {
  type = string
  default = "DevOps Training Security Group GitOps"
  description = "Name of the security group to use"
}
variable "ec2_iam_instance_profile" {
  type = string
  description = "IAM role for the ec2 instance"
  default = "NgRx_Chat_EC2_Role"
}
variable "domain_name" {
  type = string
  description = "[OPTIONAL] domain name for route53"
}
variable "root_domain_name" {
  type = string
  description = "root domain name without any subdomains"
}