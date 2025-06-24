variable "dynatrace_api_url" {
  description = "Dynatrace API URL, e.g., https://your-environment.live.dynatrace.com/api"
  type        = string
}

variable "dynatrace_token" {
  description = "Dynatrace API token with required permissions"
  type        = string
  sensitive   = true
}