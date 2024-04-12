resource "volterra_service_policy" "example" {
  for_each               = local.vips
  name                   = each.key
  namespace              = local.namespace
  algo                   = "algo"

  allow_list { 
    prefix_list {
      prefixes = each.value.allowed_prefix_list
    }
  default_action_deny = true

}
  any_server = true
}