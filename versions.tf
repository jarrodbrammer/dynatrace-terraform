terraform {
  required_version = ">= 1.2.0"

  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.82.0"
    }
  }
}

provider "dynatrace" {
#   api_url = var.dynatrace_api_url
#   token   = var.dynatrace_token
}