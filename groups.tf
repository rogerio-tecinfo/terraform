resource "azuread_group" "it" {
  display_name = "IT Department"
  security_enabled = true
}

resource "azuread_group_member" "it" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "IT" }

  group_object_id  = azuread_group.it.id
  member_object_id = each.value.id
}

resource "azuread_group" "it_managers" {
  display_name = "IT - Managers"
  security_enabled = true
}

resource "azuread_group_member" "it_managers" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Manager" }

  group_object_id  = azuread_group.it_managers.id
  member_object_id = each.value.id
}

resource "azuread_group" "it_engineers" {
  display_name = "IT - Engineers"
  security_enabled = true
}

resource "azuread_group_member" "it_engineers" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Engineer" }

  group_object_id  = azuread_group.it_engineers.id
  member_object_id = each.value.id
}

