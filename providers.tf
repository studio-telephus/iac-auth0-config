provider "auth0" {
  domain        = module.bw_auth0_provider_config.data.domain
  client_id     = module.bw_auth0_provider_config.data.client_id
  client_secret = (module.bw_auth0_provider_config.data.client_secret)
  debug         = false
}
