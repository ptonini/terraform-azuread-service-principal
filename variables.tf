variable "name" {}

variable "alternative_names" {
  type    = set(string)
  default = null
}

variable "notification_email_addresses" {
  type    = set(string)
  default = null
}

variable "owners" {
  type    = set(string)
  default = null
}


variable "create_password" {
  default = false
}

variable "scopes" {
  type = map(object({
    scope                = string
    role_definition_name = string
  }))
  default = {}
}

variable "group_memberships" {
  type    = set(string)
  default = []
}