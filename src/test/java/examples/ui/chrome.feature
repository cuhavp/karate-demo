Feature: browser automation

  Background:
    * configure driver = { type: 'chrome', executable: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' }
  # * configure driver = { type: 'chromedriver', port: 9515, executable: '/Users/pthomas3/dev/webdriver/chromedriver' }
  # * configure driver = { type: 'geckodriver', port: 4444, executable: '/Users/pthomas3/dev/webdriver/geckodriver' }
  # * configure driver = { type: 'mswebdriver', port: 17556, executable: 'C:/Users/pthomas3/Downloads/MicrosoftWebDriver.exe' }
#   * configure driver = { type: 'safaridriver', port: 4444, executable: 'safaridriver' }

  Scenario: try to login to github and then do a google search

    Given driver  'https://github.com/login'
    And driver.input #login_field = 'hello'
    And driver.input #password = 'world'
    When driver.submit //input[@name='commit']
    Then match driver.html('#js-flash-container') contains 'Incorrect username or password.'

    Given driver 'https://google.com'
    And driver.input //input[@name='q'] = 'karate dsl'
    When driver.submit //input[@name='btnI']
    Then match driver.location == 'https://github.com/intuit/karate'
