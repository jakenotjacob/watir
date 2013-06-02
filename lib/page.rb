require 'watir'
require 'rspec'
require 'page-object'
require 'yaml'

module Page

    @@GLOBAL_CONFIG = YAML::load_file('../fixtures/global.yaml')
    URL = @@GLOBAL_CONFIG[:url]

    @@USER = @@GLOBAL_CONFIG[:user][:username]
    @@PASS = @@GLOBAL_CONFIG[:user][:password]

    def initialize(browser)
        @browser = browser
    end
    
    # => Login stuffs
    def login_as
        user_field.set(@@USER)
        password_field.set(@@PASS)
        login_button.click
    end

    def open
        @browser.goto @URL
        self
    end

    def close
       @browser.close
    end

    def resize
        @browser.window.move_to(0, 0)
        @browser.window.resize_to(1024, 768)
    end

    def save
        save_button.click
    end

    def user_field
        @browser.text_field(:name, 'username')
    end

    def password_field
        @browser.text_field(:name, 'password')
    end

    def login_button
        @browser.link(:id, 'submit')
    end

    def save_button
        @browser.button(:id => 'save')
    end

    # => Class Definitions
    def login_page
        @login_page = Logins.new(@browser)
    end

    def location_page
        @location_page = Locations.new(@browser)
    end

    def extension_page
        @extension_page = Extensions.new(@browser)
    end

end # Page