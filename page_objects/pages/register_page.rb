class RegisterPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_up'

  element :first_name_field, '#new_user_first_name'
  element :last_name_field, '#new_user_last_name'
  element :username_field, '#new_user_username'
  element :email_field, '#new_user_email'
  element :password_field, '#new_user_password'
  element :register_button, '.btn-confirm'
  element :role_field, '#user_role'
  element :registration_objective_field, '#user_registration_objective'
  element :different_reason_field, '#jobs_to_be_done_other'
  element :get_started_button, '[data-qa-selector="get_started_button"]'

end