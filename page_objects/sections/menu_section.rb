class Menu < SitePrism::Section
  element :user_picture, '.js-nav-user-dropdown > a'
  element :user_name, '[data-qa-selector="user_profile_link"]'
end