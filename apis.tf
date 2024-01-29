locals {
  hub_api_iam_scopes = [
    {
      name        = "create:appointments"
      description = "Ability to create appointments"
    },
    {
      name        = "read:appointments"
      description = "Ability to read appointments"
    }
  ]
}

resource "auth0_resource_server" "hub_api_iam_dev" {
  name        = "hub_api_iam_dev"
  identifier  = "https://hub-api.iam.dev.acme.corp"
  signing_alg = "RS256"
  allow_offline_access                            = true
  token_lifetime                                  = 8600
  skip_consent_for_verifiable_first_party_clients = true
  enforce_policies = true
  token_dialect = "access_token_authz"
}

resource "auth0_resource_server_scopes" "hub_api_iam_dev" {
  resource_server_identifier = auth0_resource_server.hub_api_iam_dev.identifier
  dynamic "scopes" {
    for_each = local.hub_api_iam_scopes
    content {
      name        = scopes.value.name
      description = scopes.value.description
    }
  }
}
