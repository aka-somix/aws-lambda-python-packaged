resource "null_resource" "build_package" {
  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    working_dir = var.source_code_folder
    command     = "pip install -r requirements.txt -t .pip --platform manylinux2014_x86_64 --implementation cp --only-binary=:all: --upgrade"
  }
}

data "archive_file" "source" {
  type        = "zip"
  source_dir  = var.source_code_folder
  output_path = "${var.source_code_folder}/../builds/${var.function_name}.zip"

  depends_on = [null_resource.build_package]
}

resource "aws_s3_object" "lambda_zip_build" {
  bucket = var.source_code_bucket
  key    = "${var.source_code_folder}/build.zip"
  source = data.archive_file.source.output_path
  etag   = data.archive_file.source.output_md5

  depends_on = [data.archive_file.source]
}
