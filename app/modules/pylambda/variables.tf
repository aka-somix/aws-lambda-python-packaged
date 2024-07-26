# This is where you put your variables declaration

variable "function_name" {
  type = string
}

variable "source_code_bucket" {
  type = string
}
variable "source_code_folder" {
  type = string
}

variable "lambda_env_vars" {
  type = map(string)
}

variable "lambda_role_arn" {
  type = string
}

variable "log_retention_days" {
  type = number
}
