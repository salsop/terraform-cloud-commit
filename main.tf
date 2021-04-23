# =====================================================================================================================
#   Panorama Configuration - Example of multiple resource changes
# =====================================================================================================================

resource "panos_panorama_device_group" "this" {
  name = "test-commit"
}

resource "panos_panorama_template_stack" "this" {
  name = "test-commit"
}

# =====================================================================================================================
#   Panorama Commit
# =====================================================================================================================

module "commit" {
  source = "./panos_commit"

  hostname = var.panorama.hostname
  api_key  = var.panorama.api_key

  # List all PANOS Objects as dependencies to ensure commit executes after all resources have been created.
  depends_on = [
    panos_panorama_device_group.this,
    panos_panorama_template_stack.this,
  ]
}