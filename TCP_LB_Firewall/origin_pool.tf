resource "volterra_origin_pool" "demo" {
  for_each               = local.pools
  name                   = each.key
  namespace              = local.namespace
  endpoint_selection     = "endpoint_selection"
  loadbalancer_algorithm = "loadbalancer_algorithm"

  origin_servers {
    // One of the arguments from this list "segment_ip private_name consul_service custom_endpoint_object vn_private_ip vn_private_name public_ip public_name private_ip k8s_service segment_name" must be set

    public_name { 
        dns_name = each.value.dns_name
    }

  }

  // One of the arguments from this list "lb_port port automatic_port" must be set
  port  = each.value.port

  // One of the arguments from this list "use_tls no_tls" must be set
  no_tls = true
}