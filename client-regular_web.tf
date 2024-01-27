resource "auth0_client" "jhi_regular_web" {
  name        = "jhi_regular_web"
  description = "JHipster Java Microservices Client"
  app_type    = "regular_web"
  callbacks = [
    "http://localhost:8080/login/oauth2/code/oidc"
  ]
  allowed_logout_urls = [
    "http://localhost:8080"
  ]
  oidc_conformant = true
  jwt_configuration {
    alg = "RS256"
  }
}

# Configuring client_secret_post as an authentication method.
resource "auth0_client_credentials" "jhi_regular_web" {
  client_id             = auth0_client.jhi_regular_web.id
  client_secret         = module.bw_auth0_app_jhi_regular_web.data.client_secret
  authentication_method = "client_secret_post"
}

output "jhi_regular_web_client_id" {
  description = "Auth0 Client ID"
  value       = auth0_client.jhi_regular_web.client_id
}
