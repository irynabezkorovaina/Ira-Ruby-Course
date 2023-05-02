# frozen_string_literal: true

class InviteMembersPage < SitePrism::Page
  element :invite_members_button, '[data-qa-selector="invite_members_button"]'
  element :search_field, '[data-qa-selector="members_token_select_input"]'
  element :found_member, '.gl-new-dropdown.gl-relative.show .dropdown-item'
  element :invite_button, '[data-qa-selector="invite_button"]'
  element :select_role_field, '[data-qa-selector="access_level_dropdown"]'
  element :developer_role_button, 'button.dropdown-item', text: 'Developer'
  element :members_added_message, '.toast-body'
end
