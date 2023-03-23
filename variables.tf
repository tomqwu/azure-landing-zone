variable "global_settings" {
  type = map(any)
}

variable "diagnostics_settings" {
  type = map(any)
}

variable "security_settings" {
  type = map(any)
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "node_pool" {
  type = list(object({
    name                  = string
    vm_size               = string
    os_disk_size_gb       = number
    node_count            = number
    enable_auto_scaling   = bool
    min_count             = number
    max_count             = number
    availability_zones    = list(string)
    orchestrator_version  = string
  }))
}

variable "tags" {
  type = map(string)
}

variable "publisher_name" {
  type = string
}

variable "publisher_email" {
  type = string
}

variable "container_app_name" {
  type = string
}

variable "image" {
  type = string
}

variable "environment" {
  type = map(any)
}

variable "ase_name" {
  type = string
}

variable "ase_subnet_id" {
  type = string
}
