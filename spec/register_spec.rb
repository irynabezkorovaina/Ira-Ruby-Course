
feature 'User registration', js: true do
  scenario 'User can register to the system' do
    @register_page = RegisterPage.new
    @register_page.load

    user_name = "test#{SecureRandom.uuid}"

    @register_page.first_name_field.set 'test'
    @register_page.last_name_field.set 'user'
    @register_page.username_field.set user_name

    expect(page).to have_selector '.validation-success.field-validation'

    @register_page.email_field.set "#{user_name}@example.com"
    @register_page.password_field.set 'testuser123'
    @register_page.register_button.click

    @register_page.role_field.select('Software Developer')
    @register_page.registration_objective_field.select('I want to store my code')
    @register_page.different_reason_field.set 'Whatever reason' if @register_page.has_different_reason_field?(visible: true)
    @register_page.get_started_button.click

    expect(page).to have_content 'Welcome to GitLab'

    @home_page = HomePage.new
    @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content 'test user'

  end
end