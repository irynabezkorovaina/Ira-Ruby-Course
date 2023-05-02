# frozen_string_literal: true

require 'ffaker'

# This class describes User model
class User
  attr_reader :username, :password, :firstname, :lastname, :email, :new_project_name, :issuetitle, :comment

  def initialize
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @username = @firstname + @lastname
    @password = FFaker::Internet.password
    @email = "#{@username}@example.org"
    @new_project_name = "#{@lastname}Project"
    generate_issue_title
    generate_comment
  end

  def generate_issue_title
    @issuetitle = FFaker::HipsterIpsum.phrase
  end

  def generate_comment
    @comment = FFaker::Lorem.sentence
  end
end
