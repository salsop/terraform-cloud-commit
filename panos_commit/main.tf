# =====================================================================================================================
#   Make API Call to Panorama - Shows error as expecting text/* or application/json, but still works.
# =====================================================================================================================

data "http" "panos_api_commit" {
  url = "https://${var.hostname}/api/?type=commit&cmd=<commit></commit>&key=${var.api_key}"
}
