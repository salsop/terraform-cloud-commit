# =====================================================================================================================
#   Panorama Configuration - Example of multiple resource changes
# =====================================================================================================================

//resource "panos_panorama_device_group" "this" {
//  name = "test-commit-dg"
//}

resource "panos_panorama_template_stack" "this" {
  name = "test-commit-stack"
  templates = [
    panos_panorama_template.this.name,
  ]
}

resource "panos_panorama_template" "this" {
  name = "test-commit-template"
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
    panos_panorama_template.this,
  ]
}