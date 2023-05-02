# frozen_string_literal: true

class Menu < SitePrism::Section
  element :user_picture, '.js-nav-user-dropdown > a'
  element :user_name, '[data-qa-selector="user_profile_link"]'
  element :menu_project_name, '#content-body'
  element :menu_user_sign_out, '[data-qa-selector="sign_out_link"]'
  element :issues_assigned, '.gl-badge.badge.badge-pill.badge-success'
end
