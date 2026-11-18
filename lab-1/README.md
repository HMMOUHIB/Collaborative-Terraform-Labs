# LAB 1 — Lire la documentation du Registry Terraform

Documentation : [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest) · [Module VPC](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

## Les trois notions à distinguer

| Notion | Rôle | Exemple (module VPC) |
|--------|------|----------------------|
| **Inputs** | Les paramètres que tu choisis et transmets au module. | `name`, `cidr`, `azs`, `public_subnets`, `enable_nat_gateway` |
| **Resources** | Les ressources AWS que le module crée en interne. | `aws_vpc`, `aws_subnet`, `aws_internet_gateway`, `aws_route_table` |
| **Outputs** | Les informations que le module te retourne après sa création. | `vpc_id`, `public_subnets`, `private_subnets` |

Dans le code :

```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"   # le module

  cidr = "10.0.0.0/16"                        # ← INPUT
}                                             # → crée des RESOURCES en interne

output "vpc_id" {
  value = module.vpc.vpc_id                   # ← OUTPUT du module
}
```

## Fichiers

| Fichier | Contenu |
|---------|---------|
| `versions.tf` | Versions de Terraform et du provider AWS |
| `providers.tf` | Configuration du provider AWS (région) |
| `variables.tf` | Déclaration des variables (inputs du projet) |
| `main.tf` | Appel du module VPC |
| `outputs.tf` | Valeurs retournées (outputs) |
| `terraform.tfvars.example` | Exemple de valeurs à copier en `terraform.tfvars` |

## Exécution

```bash
cd lab-1
cp terraform.tfvars.example terraform.tfvars

terraform init       # télécharge le provider et le module
terraform fmt        # formate le code
terraform validate   # vérifie la syntaxe
terraform plan       # affiche ce qui va être créé
terraform apply      # crée les ressources
terraform output     # affiche les outputs (ID du VPC, subnets…)
terraform destroy    # supprime tout à la fin du TP
```

## AWS Academy Learner Lab

- Démarrer le lab, puis **AWS Details → AWS CLI** et coller le bloc dans `~/.aws/credentials` (il contient `aws_session_token`, qui expire à chaque session).
- Région : `us-east-1`.
- `enable_nat_gateway = false` par défaut : une NAT Gateway coûte des crédits.
- Toujours faire `terraform destroy` en fin de séance.
