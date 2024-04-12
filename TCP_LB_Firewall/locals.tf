locals {
namespace = "your-namespace"

vips = {
      "vip01" = {
        "vip_port"  = "444"
        "pool" = "demo"
        "allowed_prefix_list" = ["1.1.1.1/32"]
      }
      "vip02" = {
        "vip_port"  = "445"
        "pool" = "demo"
        "allowed_prefix_list" = ["8.8.8.8/32","1.1.1.1/32"]
      }
      "vip03" = {
        "vip_port"  = "446"
        "pool" = "demo"
        "allowed_prefix_list" = ["8.8.8.8/32","1.1.1.1/32"]
      }
      "vip04" = {
        "vip_port"  = "447"
        "pool" = "demo"
        "allowed_prefix_list" = ["8.8.8.8/32","1.1.1.1/32"]
      }
  }

pools = {
      "demo" = {
        "dns_name" = "www.example.com"
        "port"  = "80"
      }
  } 

}