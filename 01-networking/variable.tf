variable "region" {
  type    = string
  default = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string
    external_id = string
  })

  default = {
    role_arn    = "xxxxx"
    external_id = "xxxxx"
  }
}

variable "tags" {
  type = map(string)
  default = {
    Project     = "not-so-simple-ecommerce"
    Environment = "production"
  }
}