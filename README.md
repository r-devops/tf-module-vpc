# tf-module-vpc

## Sample Module 

```terraform
module "vpc" {
  source = ""
  VPC_CIDR = var.VPC_CIDR // Type: List, First Index used as primary VPC, Values from Second 
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
  PUBLIC_SUBNETS = var.PUBLIC_SUBNETS
}
```
