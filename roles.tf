# Create roles for JHipster app
resource "auth0_role" "admin" {
  name        = "ROLE_ADMIN"
  description = "Administrator"
}

resource "auth0_role" "user" {
  name        = "ROLE_USER"
  description = "User"
}

resource "auth0_role_permissions" "role_user_hub_api_permissions" {
  role_id = auth0_role.user.id
  dynamic "permissions" {
    for_each = local.hub_api_iam_scopes
    content {
      name                       = permissions.value.name
      resource_server_identifier = auth0_resource_server.hub_api_iam_dev.identifier
    }
  }
}
