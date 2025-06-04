resource "aws_dynamodb_table" "available_services" {
  name         = "${local.prefix}available_services"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "service_id"

  attribute {
    name = "service_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "appointments" {
  name         = "${local.prefix}appointments"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "appointment_id"

  attribute {
    name = "appointment_id"
    type = "S"
  }

  attribute {
    name = "appointment_date"
    type = "S"
  }

  global_secondary_index {
    name            = "appointment_date_index"
    hash_key        = "appointment_date"
    projection_type = "ALL"
  }
}
