# Define AWS as our provider

provider "aws" {
  region = var.aws_region
  shared_credentials_file = "/Users/Roopesh.Jupudi/.aws/credentials"
  profile                 = "roopesh_personal"
}