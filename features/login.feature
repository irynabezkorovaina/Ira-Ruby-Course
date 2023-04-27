Feature: User Login

Background: 
Given User is created via API

Scenario: User can successfully login to 
  When I login to GitLab
  Then I can see welcome message
  And I can see valid user data
  And I can delete user via API
