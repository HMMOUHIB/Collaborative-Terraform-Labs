variable "aws_region" {
  description = "Région AWS (AWS Academy Learner Lab : us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
  default     = "cim-j-a-vpc"
}

variable "vpc_cidr" {
  description = "Bloc CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Zones de disponibilité utilisées"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "CIDR des subnets publics (un par AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "CIDR des subnets privés (un par AZ)"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "enable_nat_gateway" {
  description = "Créer une NAT Gateway (payante — false par défaut pour le Learner Lab)"
  type        = bool
  default     = false
}
