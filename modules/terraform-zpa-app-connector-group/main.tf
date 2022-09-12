################################################################################
# Create ZPA Provisioning Key and App Connector Group
################################################################################
# Retrieve Connector Enrollment Cert ID
data "zpa_enrollment_cert" "connector_cert" {
  name = var.enrollment_cert
}

# Create App Connector Group
resource "zpa_app_connector_group" "app-connector-group" {
  name                     = var.app_connector_group_name
  description              = var.app_connector_group_description
  enabled                  = var.app_connector_group_enabled
  country_code             = var.app_connector_group_country_code
  latitude                 = var.app_connector_group_latitude
  longitude                = var.app_connector_group_longitude
  location                 = var.app_connector_group_location
  upgrade_day              = var.app_connector_group_upgrade_day
  upgrade_time_in_secs     = var.app_connector_group_upgrade_time_in_secs
  override_version_profile = var.app_connector_group_override_version_profile
  version_profile_id       = var.app_connector_group_version_profile_id
  dns_query_type           = var.app_connector_group_dns_query_type
}

# Create App Connector provisioning key
resource "zpa_provisioning_key" "provisioning-key" {
  name               = var.provisioning_key_name
  enabled            = var.provisioning_key_enabled
  association_type   = var.provisioning_key_association_type
  max_usage          = var.provisioning_key_max_usage
  enrollment_cert_id = data.zpa_enrollment_cert.connector_cert.id
  zcomponent_id      = zpa_app_connector_group.app-connector-group.id
  depends_on = [
    zpa_app_connector_group.app-connector-group
  ]
}