module "mac_pool" {
  source  = "terraform-cisco-modules/pools-mac/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "default MAC Pool"
  mac_blocks = [
    {
      from = "00:25:B5:00:00:00"
      size = 1000
    }
  ]
  name         = "default"
  organization = "default"
}

