resource "azuread_application" "this" {
  display_name = var.name
}

resource "azuread_service_principal" "this" {
  client_id                    = azuread_application.this.client_id
  alternative_names            = var.alternative_names
  notification_email_addresses = var.notification_email_addresses
  owners                       = var.owners
}

resource "azuread_service_principal_password" "this" {
  count                = var.create_password ? 1 : 0
  service_principal_id = azuread_service_principal.this.id
  value                = null
}

resource "azuread_group_member" "this" {
  for_each         = var.group_memberships
  group_object_id  = each.value
  member_object_id = azuread_service_principal.this.object_id
}

resource "azurerm_role_assignment" "this" {
  for_each             = var.scopes
  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = azuread_service_principal.this.object_id
}
