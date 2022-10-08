module "main" {
  source           = "../.."
  assignment_order = "sequential"
  description      = "default MAC Pool."
  mac_blocks = [
    {
      from = "00:25:B5:F0:00:00"
      size = 1000
    }
  ]
  name         = var.name
  organization = "terratest"
}
