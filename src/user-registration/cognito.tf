resource "aws_cognito_user_pool" "user_pool" {
  name = "${local.project_name}-user-pool-${var.environment}"

  auto_verified_attributes = ["email", "phone_number"]
  username_attributes      = ["email", "phone_number"]

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
  }

  schema {
    attribute_data_type = "String"
    name                = "name"
    required            = true
  }

  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
  }

  schema {
    attribute_data_type = "String"
    name                = "phone_number"
    required            = true
  }

  sms_configuration {
    external_id    = "" # Not required
    sns_caller_arn = aws_iam_role.cognito_sms.arn
  }
}
