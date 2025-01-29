variable "client_name" {}

variable "environments" {
  type    = list(string)
  default = ["dev", "qa", "prod"]
}

variable "enable_https" {
  type    = bool
  default = true
}