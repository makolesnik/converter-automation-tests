require_relative('locators')

def dummy_assert(actual, expected)
  raise("Expected value is #{expected}, but got #{actual}") if actual != expected
end

Given(/^I land on help popup$/) do
  text('Help')
end

When(/^I click on ([^"]*)$/) do |value|
  find_element(LOCATORS[value]).click
end

Then(/^I (?:see|get) "([^"]*)" in ([^"]*)$/) do |value, element|
  actual_value = find_element(LOCATORS[element]).text
  dummy_assert(actual_value, value)
end

When(/^I enter "([^"]*)" to ([^"]*)$/) do |value, element|
  find_element(LOCATORS[element]).send_keys(value)
end

And(/^I press "([^"]*)" on soft keyboard$/) do |value|
  digits = value.split('')
  digits.each { |key| press_keycode 7 + Integer(key) }
end

When(/^I select "([^"]*)" from ([^"]*)$/) do |value, element|
  select_list_item(value, element)
end
