# frozen_string_literal: true

Given(/^I register 'Project Owner' user via 'API'$/) do
  @project_owner = User.new
  response = create_user_api @project_owner
  @project_owner_id = JSON.parse(response.body)['id']
end

And(/^I see this 'Project Owner' user is registered via 'API'$/) do
  response = get_user_api(@project_owner)
  expect(response.code).to eq(200)
end

And(/^I register 'Developer' user via 'API'$/) do
  @developer = User.new
  response = create_user_api(@developer)
  @developer_id = JSON.parse(response.body)['id']
end

And(/^I see this 'Developer' user is registered via 'API'$/) do
  response = get_user_api(@developer)
  expect(response.code).to eq(200)
end

When(/^I log in to gitlab with 'Project Owner' user$/) do
  login_user(@project_owner.username, @project_owner.password)
end

Then(/^I can see 'Create a project' button on the 'Home Page'$/) do
  @home_page = HomePage.new
  expect(@home_page.link.create_project_link).to have_content 'Create a project'
end

When(/^I create a new blank project$/) do
  @home_page.link.create_project_link.click
  @new_project_page = NewProjectLinks.new
  @new_project_page.create_blank_project.click
  @name = project_name(@project_owner)
end

Then(/^I see that project was successfully created$/) do
  @project_page = ProjectPage.new
  @project_created_flash = "Project '#{@project_owner.new_project_name}' was successfully created."
  expect(@project_page.page_title).to have_content(@project_created_flash)
end

When(/^I open 'Project members' page$/) do
  @project_page.project_information.hover
  @project_page.members.click
end

Then(/^I can see 'Invite members' button$/) do
  @invite_members_page = InviteMembersPage.new
  expect(@invite_members_page).to have_invite_members_button
end

When(/^I click 'Invite members' button$/) do
  @invite_members_page.invite_members_button.click
end

And(/^I can see fill in search field with 'Developer' user name$/) do
  expect(@invite_members_page).to have_search_field
  @invite_members_page.search_field.set(@developer.username)
end

Then(/^I can see 'Developer' user is found$/) do
  expect(@invite_members_page.found_member).to have_content @developer.username
end

When(/^I select Developer role$/) do
  @invite_members_page.found_member.click(text: @developer.username)
  @invite_members_page.select_role_field.click
  @invite_members_page.developer_role_button.click
end

And(/^I click Invite button$/) do
  @invite_members_page.invite_button.click
end

Then(/^I can see that 'Developer' user was invited$/) do
  expect(@invite_members_page.members_added_message).to have_content 'Members were successfully added'
end

When(/^I create new issue$/) do
  @project_page.issues.hover
  @project_page.issues_list.click
  @issues_page = IssuesPage.new
  @issues_page.new_issue_button.click
  @user = User.new
  @issues_page.issue_title_field.set(@user.issuetitle)
end

Then(/^I can see that I can assign it to a 'Developer' user$/) do
  @issues_page.assignee_field.click
  @issues_page.assignee_search_field.set(@developer.username)
  sleep 1
  @issues_page.select_assignee.click(text: @developer.username)
  @issues_page.create_issue_button.click
end

When(/^I log out$/) do
  logout_user
end

And(/^I log in to gitlab with 'Developer' user$/) do
  login_user(@developer.username, @developer.password)
end

Then(/^I can see that I have an issue assigned$/) do
  expect(@home_page.menu.issues_assigned).to have_content('1')
end

When(/^I open the issue$/) do
  @home_page.menu.issues_assigned.click
  @issues_page.open_issue.click
end

Then(/^I can leave a text comment$/) do
  @issues_page.comment_field.click
  @issues_page.comment_field.set(@user.comment)
  @issues_page.comment_button.click
end

And(/^I can attach png file to comment$/) do
  within '.gl-w-full.gl-relative' do
    attach_file('upload_file', File.absolute_path('./files/new-test.png'), make_visible: true)
  end
  page.refresh
  sleep 2
end

And(/^I can 'Add a to do'$/) do
  @issues_page.add_a_to_do_button.click
  sleep 2
end

And(/^I can 'Mark as done'$/) do
  @issues_page.mark_as_done_button.click
end

And(/^I can close the issue$/) do
  @issues_page.close_issue_button.click
end

Then(/^I can go to Project General settings$/) do
  @general_settings_page = GeneralSettingsPage.new
  @general_settings_page.project_name.click
  @general_settings_page.settings.hover
  @general_settings_page.settings_general.click
end

When(/^I expand Advanced Settings$/) do
  @general_settings_page.advanced_expand_button.click
end

And(/^I delete project$/) do
  @general_settings_page.delete_project_button.click
  @project_name_value = @general_settings_page.project_name_id.text
  @general_settings_page.confirm_name_input.set(@project_name_value)
  @general_settings_page.delete_project_button_confirmation.click
end

Then(/^I see that project is deleted$/) do
  expected_text = "Project '#{@project_owner.firstname} #{@project_owner.lastname} / #{@project_owner.new_project_name}' is in the process of being deleted."
  expect(@general_settings_page.flash_message).to have_content(expected_text)
end

Then(/^I can delete 'Project Owner' user via API$/) do
  delete_user_api(@project_owner_id)
end

And(/^I can delete 'Developer' user via API$/) do
  delete_user_api(@developer_id)
end
