module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 4.0"

    project_id   = var.project_id
    network_name = "network-boa-dev"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "gke-boa-us-central1"
            subnet_ip             = "10.0.0.0/17"
            subnet_region         = "us-west1"
        }
    ]

    secondary_ranges = {
        gke-boa-us-central1 = [
            {
                range_name    = "gke-boa-pods"
                ip_cidr_range = "192.168.0.0/18"
            },
            {
                range_name    = "gke-boa-services"
                ip_cidr_range = "192.168.64.0/18"
            },
        ]

        subnet-02 = []
    }

    depends_on = [module.project_services]
}
