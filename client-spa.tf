resource "auth0_client" "jhi_spa" {
  name        = "jhi_spa"
  description = "JHipster React Single-Page Application Client"
  app_type    = "spa"
  callbacks = [
    "http://localhost:9000/callback"
  ]
  oidc_conformant     = true
  # initiate_login_uri = "http://localhost:9000/login"
  allowed_origins     = ["http://localhost:9000"]
  allowed_logout_urls = ["http://localhost:9000"]
  web_origins         = ["http://localhost:9000"]

  grant_types = [
    "authorization_code",
    "refresh_token"
  ]

  jwt_configuration {
    alg = "RS256"
  }

  refresh_token {
    leeway          = 0
    token_lifetime  = 2592000
    rotation_type   = "rotating"
    expiration_type = "expiring"
  }
}
