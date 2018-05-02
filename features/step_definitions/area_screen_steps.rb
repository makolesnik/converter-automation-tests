def dummy_assert(actual, expected)
  raise("Expected value is #{expected}, but got #{actual}") if actual != expected
end

LOCATORS = {
  'Got it button' => { id: 'button1' },
  'Swap button' => { id: 'fab' },
  'Clear button' => { id: 'menu_clear' },
  'From header' => { id: 'header_text_unit_from' },
  'To header' => { id: 'header_text_unit_to' },
  'From field' => { id: 'header_value_from' },
  'To field' => { id: 'header_value_to' }
}.freeze

Given(/^I land on help popup$/) do
  text('Help')
end

Then(/^I land on Area screen$/) do
  text('Area')
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
