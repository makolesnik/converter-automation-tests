require_relative('locators')

def dummy_assert(actual, expected)
  raise("Expected value is #{expected}, but got #{actual}") if actual != expected
end

Given(/^I swipe app menu$/) do
  action = Appium::TouchAction.new.swipe(start_x: 0.01, start_y: 0.5, end_x: 0.9, end_y: 0.5, duration: 500)
  action.perform
end

Then(/^I see app menu$/) do
  find_element(LOCATORS['app menu']).find_element(LOCATORS['area_menu'])
  find_element(LOCATORS['app menu']).find_element(LOCATORS['cooking_menu'])
  find_element(LOCATORS['app menu']).find_element(LOCATORS['currency_menu'])
end

And(/^I select "([^"]*)" in menu$/) do |value|
  select_menu_item(value)
end

Then(/^I land on "([^"]*)" screen$/) do |value|
  LOCATORS['toolbar'].find_element(xpath: "//android.widget.TextView[@text='#{value}']")
end
