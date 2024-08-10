provider "aws" {
  region = "us-east-1" # Update as needed
}

module "ec2" {
  source = "./modules/ec2"
}
