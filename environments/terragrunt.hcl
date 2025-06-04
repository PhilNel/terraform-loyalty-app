remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "loyalty-app-terraform-state-bucket"
    key            = "dev/loyalty-app-user/${path_relative_to_include()}/terraform.tfstate"
    region         = "af-south-1"
    encrypt        = true
    dynamodb_table = "loyalty-app-terraform-locks"
  }
}

locals {
  aws_region           = "af-south-1"
  artefact_bucket_name = "web-scraper-artefacts-dev-af-south-1"
  environment          = "dev"
}