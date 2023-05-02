# frozen_string_literal: true

class GeneralSettingsPage < SitePrism::Page
  element :project_name, '.project-full-name.gl-mr-3'
  element :settings, '#js-onboarding-settings-link'
  element :settings_general, '[data-track-label="general"]'
  element :advanced_expand_button,
          '[data-qa-selector="advanced_settings_content"] .btn.gl-button.btn-default.js-settings-toggle'
  element :delete_project_button, '.gl-inset-border-l-3-red-600 .btn.btn-danger.btn-md.gl-button'
  element :project_name_id, '.gl-white-space-pre-wrap'
  element :confirm_name_input, '#confirm_name_input'
  element :delete_project_button_confirmation, '.js-modal-action-primary.btn-danger'
  element :flash_message, '[data-qa-selector="flash_container"]'
end
