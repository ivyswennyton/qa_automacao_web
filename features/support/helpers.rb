require 'fileutils'

module Helpers
  def screenshot(file_name, result)
    folder_path = "report/screenshots/test_#{result}"
    screen = "#{folder_path}/.#{file_name}.png"
    page.save_screenshot(screen)
    attach(screen, 'image/png')
  end

  def switch_last_browser
    newtab = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(newtab)
  end

  def switch_first_browser
    maintab = page.driver.browser.window_handles.first
    page.driver.browser.switch_to.window(maintab)
  end

  def element_wait_time(time)
    sleep(time)
  end
end
