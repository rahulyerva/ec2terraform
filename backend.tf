terraform {
  backend "s3" {
    bucket = "s3forterrafrom"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
