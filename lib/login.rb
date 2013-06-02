require 'page'
require 'watir'
require 'yaml'

class Logins < Page

    @@config = YAML::load_file('../fixtures/users.yaml')
    
    def initialize(browser)
        @browser = browser
        @browser.window.move_to(0, 0)
        @browser.window.resize_to(1024, 768)
        @URL = URL + '#'

        @user = @@config[:user][:username]
        @pass = @@config[:user][:password]
    end

    def open
        @browser.goto @URL
        self
    end

    def login_as
        user_field.set(@user)
        password_field.set(@pass)
        login_button.click
    end

    def user_field
        @browser.text_field(:name => "username")
    end

    def password_field
        @browser.text_field(:name => "password")
    end

    def login_button
        @browser.link(:id => "submit")
    end

    def home_page
        @browser.div(:class => 'mfc-container')
    end
end # LoginPage