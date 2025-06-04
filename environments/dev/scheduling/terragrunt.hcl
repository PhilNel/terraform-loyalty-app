include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {  
  source = "../../../src//scheduling"
}

locals {
  base = include.root.locals
}

inputs = {
  environment = local.base.environment
}