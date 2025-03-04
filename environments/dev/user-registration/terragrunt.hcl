include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {  
  source = "../../../src//user-registration"
}

inputs = {
  environment = "dev"
}