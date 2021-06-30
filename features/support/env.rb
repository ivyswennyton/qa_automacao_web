require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'date'
require 'report_builder'
require 'rspec'
require 'pry'
require 'yaml'
require_relative '../../features/support/helpers'

include Helpers

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environments/#{ENV['ENV_TYPE']}.yml"))

DATA =
  if ENV['DEV']
    YAML.load_file('features/support/config/environments/dev.yml')
  elsif ENV['HML']
    YAML.load_file('features/support/config/environments/hml.yml')
  else
    YAML.load_file('features/support/config/environments/dev.yml')
  end

@browser = ENV['BROWSER']

Capybara.configure do |config|
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'chrome_headless'
    Capybara.register_driver :selenium_chrome_headless do |app|
      chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
        options.add_argument '--headless'
        options.add_argument '--disable-gpu'
        options.add_argument '--no-sandbox'
        options.add_argument '--disable-site-isolation-trials'
      end
      Capybara::Selenium::Driver.new(app,
                                     browser: :chrome,
                                     options: chrome_options)
    end
    @driver = :selenium_chrome_headless
  when 'firefox'
    @driver = :selenium
  when 'firefox_headless'
    @drive = :selenium_headless
  end

  config.default_driver = @driver
  config.app_host = CONFIG['url']
  config.default_max_wait_time = 20
end
