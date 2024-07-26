# This is where you put your outputs declaration

output "arn" {
  value = aws_lambda_function.this.arn
}

output "logs" {
  value = aws_cloudwatch_log_group.this_logs.id
}
