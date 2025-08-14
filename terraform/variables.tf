variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}
variable "ami_id" {
  description = "AMI for the EC2 instance (Amazon Linux 2)."
  type        = string
  default     = "ami-0de716d6197524dd9"
}