# frozen_string_literal: true

class IssuesPage < SitePrism::Page
  element :new_issue_button, '.btn-confirm.btn-md'
  element :issue_title_field, '#issue_title'
  element :assignee_field, '.js-user-search.js-assignee-search .dropdown-toggle-text'
  element :assignee_search_field, '[data-qa-selector="dropdown_input_field"]'
  element :select_assignee, '.dropdown-menu-assignee .dropdown-content'
  element :create_issue_button, '[data-qa-selector="issuable_create_button"]'
  element :open_issue, '.js-onboarding-issue-item'
  element :comment_field, '[data-qa-selector="comment_field"]'
  element :comment_button, '.split-content-button'
  element :submitted_comment, '.js-task-list-container .note-text.md'
  element :attach_file_button, '.gl-vertical-align-text-bottom.btn-link.btn-md.gl-button'
  element :add_a_to_do_button, '.js-right-sidebar [aria-label="Add a to do"]'
  element :mark_as_done_button, '.js-right-sidebar [aria-label="Mark as done"]'
  element :close_issue_button, '[data-qa-selector="close_issue_button"]'
  element :assigned_issue_link, '.todo-target-link'
  element :assignee_side_bar, '.ml-2.gl-line-height-normal'
end
