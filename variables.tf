variable "name" {
  type = string
}

variable "sentry_dsn" {
  type = string
}

variable "message" {
  type = string
}

variable "tags" {
  default     = {}
  description = "Tags to use for each of the created resources."
}
