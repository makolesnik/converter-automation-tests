require 'appium_lib'
require_relative './../step_definitions/locators'

def caps
  { caps: {
    deviceName: 'Name',
    platformName: 'Android',
    app: File.join(File.dirname(__FILE__), 'ultimate_converter.apk'),
    appPackage: 'com.physphil.android.unitconverterultimate',
    appActivity: 'com.physphil.android.unitconverterultimate.MainActivity',
    newCommandTimeout: '3600'
  } }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

def select_menu_item(value)
  condition = (exists { find_element(LOCATORS['app menu']).find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']") })
  swipe_until(condition, reverse = false)
  if exists { find_element(LOCATORS['app menu']).find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']") }
    find_element(LOCATORS['app menu']).find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']").click
  else
    raise("Element #{value} was not found in menu")
  end
end

def select_list_item(value, element)
  condition = (exists do
                 find_element(LOCATORS[element])
                   .find_element(xpath: "//android.widget.RadioButton[@text='#{value}']")
               end)

  swipe_until(condition, reverse = false)
  swipe_until(condition, reverse = true) unless exists { find_element(LOCATORS[element]).find_element(xpath: "//android.widget.RadioButton[@text='#{value}']") }

  if exists { find_element(LOCATORS[element]).find_element(xpath: "//android.widget.RadioButton[@text='#{value}']") }
    find_element(LOCATORS[element])
      .find_element(xpath: "//android.widget.RadioButton[@text='#{value}']").click
  else
    raise("Element #{value} was not found in list")
  end
end

def swipe_until(condition, reverse = false)
  # reverse = false  to scroll top-to-bottom
  # reverse = true  to scroll bottom-to-top
  current_screen = get_source
  previous_screen = ''
  action = Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, offset_x: 0.5, offset_y: 0.2, duration: 500)
  if reverse
    action = Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.5, offset_x: 0.5, offset_y: 0.8, duration: 500)
  end
  until condition || (current_screen == previous_screen)
    action.perform
    previous_screen = current_screen
    current_screen = get_source
  end
end
