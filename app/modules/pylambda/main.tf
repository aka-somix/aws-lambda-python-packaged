resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.lambda_role_arn

  s3_bucket        = aws_s3_object.lambda_zip_build.bucket
  s3_key           = aws_s3_object.lambda_zip_build.key
  source_code_hash = aws_s3_object.lambda_zip_build.etag

  runtime                        = "python3.12"
  memory_size                    = 128
  handler                        = "main.lambda_handler"
  timeout                        = 5
  reserved_concurrent_executions = 10


  environment {
    variables = var.lambda_env_vars
  }

  logging_config {
    log_format = "JSON"
    log_group  = aws_cloudwatch_log_group.this_logs.id
  }

}


# -------------- Cloudwatch Log Group --------------
resource "aws_cloudwatch_log_group" "this_logs" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_days
}
