# frozen_string_literal: true

require 'dotenv/load'
require 'capybara/cucumber'
require 'require_all'
require 'rest-client'
require 'selenium-webdriver'
require 'site_prism'

require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'modules'

def chrome_options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Before do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

World(Helpers, ApiWrappers)
