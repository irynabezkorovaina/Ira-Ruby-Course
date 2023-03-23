
feature 'User registration', js: true do
  scenario 'User can register to the system' do
    user = User.new
    register_user user

    expect(page).to have_content 'Welcome to GitLab'

    @home_page = HomePage.new
    @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content user.firstname
    expect(@home_page.menu.user_name).to have_content user.lastname

  end
end