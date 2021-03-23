#!/usr/bin/ruby
require 'selenium-webdriver'

def setup
    Selenium::WebDriver::Chrome::Service.driver_path = "/usr/bin/chromedriver"

    # options
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')

    # create driver using options and capabilities
    @driver = Selenium::WebDriver.for :chrome, options: options

end

def teardown
    @driver.quit
end

def run
    setup
    yield
    teardown
end

run do
    # go to google search page
    @driver.get 'http://www.github.com'

    # create screenshot of search results
    print "RESULTS TITLE: #{@driver.title}\n"
end