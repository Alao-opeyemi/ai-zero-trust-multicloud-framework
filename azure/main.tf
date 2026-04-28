# Azure Zero Trust Conditional Access
# Requires MFA and compliant device for all users and applications
resource "azuread_conditional_access_policy" "zero_trust" {
 display_name = "Zero Trust - Require MFA and Compliant Device"
 state = "enabled"
 conditions {
    users { include_users = ["All"] }
    applications { include_applications = ["All"] }
    locations { include_locations = ["All"] }
 }
 grant_controls {
    operator = "AND"
    built_in_controls = ["mfa", "compliantDevice"]
 }
 session_controls {
    sign_in_frequency = 4
    sign_in_frequency_period = "hours"
    persistent_browser_session_is_enabled = false
 }
}