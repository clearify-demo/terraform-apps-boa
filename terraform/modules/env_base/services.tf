module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 10.1"

  project_id = var.project_id

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
  ]
}
