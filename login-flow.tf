# Create an action to customize the authentication flow to add the roles and the username to the access token claims expected by JHipster applications.
resource "auth0_action" "jhi_post_login_action" {
  name    = "jhipster_roles_claim"
  runtime = "node18"
  deploy  = true
  code    = <<-EOT
  /**
   * Handler that will be called during the execution of a PostLogin flow.
   *
   * @param {Event} event - Details about the user and the context in which they are logging in.
   * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
   */
   exports.onExecutePostLogin = async (event, api) => {
     const namespace = 'https://www.jhipster.tech';
     if (event.authorization) {
         api.idToken.setCustomClaim('preferred_username', event.user.email);
         api.idToken.setCustomClaim(namespace + '/roles', event.authorization.roles);
         api.accessToken.setCustomClaim(namespace + '/roles', event.authorization.roles);
     }
   };
  EOT

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

# attach the action to the login flow
resource "auth0_trigger_actions" "jhi_login_flow" {
  trigger = "post-login"

  actions {
    id           = auth0_action.jhi_post_login_action.id
    display_name = auth0_action.jhi_post_login_action.name
  }
}
