# frozen_string_literal: true

class NewProjectLinks < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/projects/new'

  element :create_blank_project, '[data-qa-panel-name="blank_project"]'
  element :create_from_template, '[data-qa-panel-name="create_from_template"]'
  element :import_project, '[data-qa-panel-name="import_project"]'
end
