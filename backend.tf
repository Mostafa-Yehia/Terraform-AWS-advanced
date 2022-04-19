terraform {
  backend "s3" {
    bucket = "mostafa-bucket1"
    key    = "mostafa.tfstate"
    region = "us-east-1"
    dynamodb_table = "mostafa-dynamodb"
    profile = "default"
  }
}
