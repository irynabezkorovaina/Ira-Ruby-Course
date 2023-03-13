
feature 'User register', js: true do
	
	let!(:timestamp) {Time.now.to_i.to_s}
	let!(:email) {"test" + timestamp + "@gmail.com"}
	let!(:user_name) {"test" + timestamp}

	scenario 'User can register in the system' do
		visit('https://gitlab.testautomate.me/')

		find('[data-qa-selector="register_link"]').click
		find('#new_user_first_name').set 'test'
		find('#new_user_last_name').set 'user'
		find('#new_user_username').set user_name
		find('#new_user_email').set email
		find('#new_user_password').set 'testuser123'
		find('[data-qa-selector="new_user_register_button"]').click
		select('Software Developer', from: "Role")
		select('I want to store my code', from: "I'm signing up for GitLab because:")
		find('[data-qa-selector="get_started_button"]').click

		expect(page).to have_content('Welcome to GitLab') 

	end
end