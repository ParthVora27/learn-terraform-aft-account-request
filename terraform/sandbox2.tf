module "sandbox-2" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "atharvaaws69+sandbox2@gmail.com"
    AccountName               = "sandbox-2"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "atharvaaws69+sandbox2@gmail.com"
    SSOUserFirstName          = "Sandbox-2"
    SSOUserLastName           = "Account"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox-2"
}
