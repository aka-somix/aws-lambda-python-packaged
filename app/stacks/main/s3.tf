data "aws_s3_bucket" "lambda_packages_bucket" {
  bucket = "cicd-lambda-packages"
}