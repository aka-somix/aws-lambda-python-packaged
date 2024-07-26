terraform {
  backend "s3" {
    bucket         = "<%= expansion('scirone-lambda-python-terraform-state-:ACCOUNT-:REGION') %>"
    key            = "<%= expansion(':ENV/:EXTRA/:BUILD_DIR/terraform.tfstate') %>"
    region         = "<%= expansion(':REGION') %>"
    dynamodb_table = "<%= expansion('scirone-lambda-python-terraform-locks-:ACCOUNT-:REGION') %>"
  }
}
