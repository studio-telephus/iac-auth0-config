module "bw_auth0_provider_config" {
  source = "github.com/studio-telephus/terraform-bitwarden-get-item-secure-note.git?ref=1.0.0"
  id     = "5bd1e5b7-fcfa-4711-ba16-b10300d7137b"
}

module "bw_auth0_app_jhi_regular_web" {
  source = "github.com/studio-telephus/terraform-bitwarden-get-item-secure-note.git?ref=1.0.0"
  id     = "55fd298f-1731-40b8-a051-b1040079776d"
}

module "bw_auth0_user_1" {
  source = "github.com/studio-telephus/terraform-bitwarden-get-item-login.git?ref=1.0.0"
  id     = "6481e129-06cd-456c-afdd-b104007c4c54"
}
