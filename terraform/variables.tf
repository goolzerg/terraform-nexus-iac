variable "docker_proxy_names" {
  description = "List of docker proxy repositores names"
  type        = list(string)
  default     = ["docker-external-dockerhub", "docker-external-google", "docker-external-microsoft"]
}

variable "docker_proxy_ports" {
  description = "List of docker proxy repositores ports"
  type        = list(number)
  default     = [5001, 5003, 5002]
}

variable "docker_proxy_urls" {
  description = "List of docker proxy repositores URLs"
  type        = list(string)
  default     = ["https://registry-1.docker.io", "https://gcr.io/google-containers", "https://mcr.microsoft.com"]
}

variable "docker_proxy_indextype" {
  description = "List of docker proxy repositores index types"
  type        = list(string)
  default     = ["HUB", "REGISTRY", "REGISTRY"]
}

variable "nexus_username" {
  description = "Name of user in Nexus for authorization"
  type        = string
}

variable "nexus_url" {
  description = "Nexus url without trailing slash"
  type        = string
  default     = "https://domain.local"
}

variable "nexus_password" {
  description = "Password for nexus user for authorization"
  type        = string
}

variable "nexus_insecure" {
  description = "Allow insecure SSL connections"
  type        = bool
  default     = true
}
