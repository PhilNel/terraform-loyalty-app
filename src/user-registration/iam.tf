data "aws_iam_policy_document" "cognito_sms_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cognito-idp.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "cognito_sms_policy" {
  statement {
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "cognito_sms" {
  name               = "${local.project_name}-cognito-sms-role"
  assume_role_policy = data.aws_iam_policy_document.cognito_sms_role_policy.json
}

resource "aws_iam_role_policy" "cognito_sms" {
  name   = "${local.project_name}-cognito-sms-policy"
  role   = aws_iam_role.cognito_sms.id
  policy = data.aws_iam_policy_document.cognito_sms_policy.json
}
