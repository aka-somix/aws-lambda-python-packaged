# This is where you put your resource declaration

#
# IAM Role for Lambda function
#
resource "aws_iam_role" "basic" {
  name = "SCironeLambdaBasicRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow"
      }
    ]
  })
}

# Lambda Basics Policy (Cloudwatch logs)
resource "aws_iam_role_policy_attachment" "basic_execution" {
  role       = aws_iam_role.basic.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

#
# SIMPLE LAMBDA DEFINITION
#
module "simple_lambda" {
  source = "../../modules/pylambda"

  function_name      = "scirone-simple-python-lambda"
  lambda_role_arn    = aws_iam_role.basic.arn
  lambda_env_vars    = {}
  log_retention_days = 30
  source_code_bucket = data.aws_s3_bucket.lambda_packages_bucket.id
  source_code_folder = "lambdas/simple"
}

#
# POLARS LAMBDA DEFINITION
#
module "polars_lambda" {
  source = "../../modules/pylambda"

  function_name      = "scirone-polars-python-lambda"
  lambda_role_arn    = aws_iam_role.basic.arn
  lambda_env_vars    = {}
  log_retention_days = 30
  source_code_bucket = data.aws_s3_bucket.lambda_packages_bucket.id
  source_code_folder = "lambdas/withpolars"
}

