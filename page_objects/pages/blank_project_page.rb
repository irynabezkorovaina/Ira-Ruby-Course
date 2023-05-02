# frozen_string_literal: true

class BlankProject < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/projects/new#blank_project'

  element :project_name_field, '.form-group.project-name input[data-track-label="blank_project"]'
  element :create_project_button, '#new_project > .js-create-project-button[data-track-label="blank_project"]'
end
