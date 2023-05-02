# frozen_string_literal: true

class ProjectPage < SitePrism::Page
  element :page_title, '.flash-notice.mb-2'
  element :project_information, '.shortcuts-project-information'
  element :members, '#js-onboarding-members-link'
  element :issues, '#js-onboarding-issues-link'
  element :issues_list, '[data-qa-menu-item="List"]'  # try another select
end
