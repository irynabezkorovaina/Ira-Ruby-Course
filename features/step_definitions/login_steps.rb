Given(/^User is created via API$/) do
 @new_user = User.new

    response = create_user_api @new_user
    @user_id = JSON.parse(response.body)['id']
end

When(/^I login to GitLab$/) do
   puts @new_user.username
	login_user @new_user.username, @new_user.password
end

Then(/^I can see welcome message$/) do
	expect(page).to have_content 'Welcome to GitLab'
end

And(/^I can see valid user data$/) do
	@home_page = HomePage.new
   @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content @new_user.firstname 
    expect(@home_page.menu.user_name).to have_content @new_user.lastname
end

And(/^I can delete user via API$/) do
	delete_user_api(@user_id)

end
