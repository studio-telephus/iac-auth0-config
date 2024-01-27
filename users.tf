# Create a test user. You can create more users here if needed
resource "auth0_user" "admin_e2e_test_account_dev" {
  connection_name = "Username-Password-Authentication"
  name            = "admin e2e-test-account-dev"
  email           = module.bw_auth0_user_1.data.username
  email_verified  = true
  password        = module.bw_auth0_user_1.data.password
  lifecycle {
    ignore_changes = [password]
  }
}

resource "auth0_user_roles" "admin_e2e_test_account_dev" {
  user_id = auth0_user.admin_e2e_test_account_dev.id
  roles = [
    auth0_role.admin.id,
    auth0_role.user.id
  ]
}
