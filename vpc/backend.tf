terraform {
  backend "s3" {
    bucket = "s3-bucket-us-east-1-06-10-2022"
    key    = "excercise/vpc-practise-with-pascal/06-10-2022/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}