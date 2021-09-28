resource "nexus_repository" "docker_proxy" {
  count  = 3
  format = "docker"
  name   = element(var.docker_proxy_names, count.index)
  type   = "proxy"
  online = true

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  docker {
    http_port        = element(var.docker_proxy_ports, count.index)
    v1enabled        = true
    force_basic_auth = false
  }

  http_client {
    blocked    = false
    auto_block = true
  }

  negative_cache {
    enabled = true
    ttl     = 1440
  }

  proxy {
    remote_url       = element(var.docker_proxy_urls, count.index)
    content_max_age  = 1440
    metadata_max_age = 1440
  }

  docker_proxy {
    index_type = element(var.docker_proxy_indextype, count.index)
  }
}

resource "nexus_repository" "docker_hosted" {
  name   = "docker-hosted"
  format = "docker"
  type   = "hosted"
  online = true

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW_ONCE"
  }

  docker {
    force_basic_auth = false
    http_port        = 5000
    v1enabled        = true
  }
}

resource "nexus_repository" "docker_group" {
  name   = "docker-group"
  online = true
  type   = "group"
  format = "docker"

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  group {
    member_names = concat(var.docker_proxy_names, tolist(["${nexus_repository.docker_hosted.name}"]))
  }

  docker {
    force_basic_auth = false
    http_port        = 5100
    v1enabled        = true
  }
}

resource "nexus_security_realms" "docker_bearer" {
  active = [
    "NexusAuthenticatingRealm",
    "NexusAuthorizingRealm",
    "DockerToken"
  ]
}
