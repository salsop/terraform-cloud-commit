# Terraform Cloud - Panorama Commit Workaround

This is a quick example of a workaround to allow Panorama to perform a commit operation after any changes to Panorama Resources.

:exclamation: As this uses the HTTP Data Source, this commit operation runs on `terraform plan`, `terraform apply`, and at the start of a `terraform destory`. When running a `terraform destroy` the commit will not run at the end of the destroy process.

## How to use this workaround

Run the module with the `hostname` and `api_key` variables, it is also important to make sure the module is dependent on all other PAN-OS changes to ensure this runs last.

```terraform
module "commit" {
  source = "./panos_commit"
  
  # Hostname or IP Address of Panorama
  hostname = "panorama-hostname"

  # API Key for a User that has permission to perform commits
  api_key  = "panorama-api-key"
  
  # List all PANOS Objects as dependencies to ensure commit executes after all resources have been created.
  depends_on = [
    panos_panorama_device_group.this,
    panos_panorama_template_stack.this,
    panos_panorama_template.this,
  ]
}
```