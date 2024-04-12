resource "volterra_tcp_loadbalancer" "demo" {
  for_each               = local.vips
  name      = each.key
  namespace = local.namespace

  // One of the arguments from this list "do_not_advertise advertise_on_public_default_vip advertise_on_public advertise_custom" must be set
  advertise_on_public_default_vip = true

  // One of the arguments from this list "retract_cluster do_not_retract_cluster" must be set
  retract_cluster = true

  // One of the arguments from this list "hash_policy_choice_round_robin hash_policy_choice_least_active hash_policy_choice_random hash_policy_choice_source_ip_stickiness" must be set
  hash_policy_choice_round_robin = true

  // One of the arguments from this list "tcp tls_tcp_auto_cert tls_tcp" must be set
  tcp = true

  // One of the arguments from this list "listen_port port_ranges" must be set
  listen_port = each.value.vip_port

  // One of the arguments from this list "service_policies_from_namespace no_service_policies active_service_policies" must be set
  active_service_policies {
    policies {
      name      = each.key
    }
  }
  // One of the arguments from this list "no_sni sni default_lb_with_sni" must be set
  no_sni = true

  // REQUIRED: Origin Pool
  origin_pools_weights {
    pool {
      name      = each.value.pool
    }
  }
  
  depends_on = [ volterra_origin_pool.demo, volterra_service_policy.example ]
  
}