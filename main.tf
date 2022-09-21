#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Intersight MAC Pool Resource
# GUI Location: Pools > Create Pool
#____________________________________________________________

resource "intersight_macpool_pool" "mac_pool" {
  assignment_order = var.assignment_order
  description      = var.description != "" ? var.description : "${var.name} MAC Pool."
  name             = var.name
  dynamic "mac_blocks" {
    for_each = { for v in var.mac_blocks : v.from => v }
    content {
      object_type = "macpool.Block"
      from        = mac_blocks.value.from
      size        = mac_blocks.value.size != null ? tonumber(mac_blocks.value.size) : null
      to          = mac_blocks.value.to != null ? mac_blocks.value.to : null
    }
  }
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
