# frozen_string_literal: true

# This module describes repeatable actions
module Helpers
  def login_user(username, password)
    @login_page = LoginPage.new
    @login_page.load

    @login_page.login_field.set username
    @login_page.password_field.set password
    @login_page.submit_button.click
  end

  def register_user(user)
    @register_page = RegisterPage.new
    @register_page.load

    @register_page.first_name_field.set user.firstname
    @register_page.last_name_field.set user.lastname
    @register_page.username_field.set user.username

    expect(page).to have_selector '.validation-success.field-validation'

    @register_page.email_field.set user.email
    @register_page.password_field.set user.password
    @register_page.register_button.click

    @register_page.role_field.select('Software Developer')
    @register_page.registration_objective_field.select('I want to store my code')
    @register_page.different_reason_field.set 'Whatever' if @register_page.has_different_reason_field?(visible: true)
    @register_page.get_started_button.click
  end

  def project_name(_project_owner)
    @blank_project_page = BlankProject.new
    @blank_project_page.load

    @blank_project_page.project_name_field.set "#{@project_owner.lastname}Project"
    @blank_project_page.create_project_button.click
  end

  def logout_user
    @home_page.menu.user_picture.click
    @home_page.menu.menu_user_sign_out.click
  end
end
