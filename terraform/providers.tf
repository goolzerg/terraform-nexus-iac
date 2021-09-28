provider "nexus" {
  insecure = var.insecure
  password = var.nexus_password
  url      = var.nexus_url
  username = var.nexus_username
}
