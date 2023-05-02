# frozen_string_literal: true

class WelcomePageLinks < SitePrism::Section
  element :create_project_link, '.blank-state-link[href="/projects/new"]'
  element :create_group, '.blank-state-link[href="/groups/new"]'
  element :exprlore_public_projects, '.blank-state-link[href="/explore/projects/trending"]'
  element :learn_more, '.blank-state-link[href="https://docs.gitlab.com/"]'
end
