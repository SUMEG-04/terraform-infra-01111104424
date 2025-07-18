variable "custom_port" {
  description = "Custom port to allow inbound traffic"
  type        = number
  default     = 8080
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}
