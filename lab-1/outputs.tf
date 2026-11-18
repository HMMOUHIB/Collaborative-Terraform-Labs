# ---- OUTPUTS : informations retournées par le module ----

output "vpc_id" {
  description = "ID du VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloc CIDR du VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "IDs des subnets publics"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "IDs des subnets privés"
  value       = module.vpc.private_subnets
}

output "igw_id" {
  description = "ID de l'Internet Gateway"
  value       = module.vpc.igw_id
}
