provider "auth0" {
  domain        = module.auth0_provider_config.data.domain
  client_id     = module.auth0_provider_config.data.client_id
  client_secret = base64decode(module.auth0_provider_config.data.client_secret)
  debug         = false
}
