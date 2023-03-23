global_settings = {
  "example-key" = "example-value"
}

diagnostics_settings = {
  "example-key" = "example-value"
}

security_settings = {
  "example-key" = "example-value"
}

client_id = "your-client-id"
client_secret = "your-client-secret"

kubernetes_version = "1.22.2"

node_pool = [
  {
    name                 = "default"
    vm_size              = "Standard_DS2_v2"
    os_disk_size_gb      = 128
    node_count           = 2
    enable_auto_scaling  = true
    min_count            = 2
    max_count            = 4
    availability_zones   = ["1", "2", "3"]
    orchestrator_version = "1.22.2"
  }
]

tags = {
  "Environment" = "Dev"
}

publisher_name = "Your Publisher Name"
publisher_email = "your.email@example.com"

container_app_name = "example-container-app"
image = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"

