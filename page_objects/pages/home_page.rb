# frozen_string_literal: true

class HomePage < SitePrism::Page
  section :menu, Menu, '.container-fluid > .header-content'
end
