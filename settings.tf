terraform {
  backend "s3" {}
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.1"
    }
    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = "~> 0.7"
    }
  }
}
