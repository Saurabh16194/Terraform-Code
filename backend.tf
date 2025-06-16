terraform {
  backend "s3" {
    bucket = "saurabhstate16194" 
    key = "prd.tfstate"
    region = "us-east-1"
    use_lockfile = true   
  }
}