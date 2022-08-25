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
  default = "/home/ec2-user"
}
variable "os_system_user" {
  type = string
  description = "User for the OS"
  default = "ec2-user"
}

variable "ops_repo_environment" {
  type = string
  description = "Ops Repo Environment (i.e. directory name)"
}

variable "aws_ami" {
  type = string
  default = "ami-0c02fb55956c7d316"
  description = "AMI id to use for the EC2 instance"
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
  default = "Bitovi_EC2_Training_GitOps"
}