output "this" {
  value = azuread_service_principal.this
}

output "application_id" {
  value = azuread_application.this.id
}

output "client_id" {
  value = azuread_application.this.client_id
}

output "password" {
  value = var.create_password ? azuread_service_principal_password.this[0] : 0
}