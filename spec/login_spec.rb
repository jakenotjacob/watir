require '../lib/login'
require 'watir'
require 'yaml'

describe "Login" do


    before :all do
        @login_page = Logins.new(Watir::Browser.new :chrome)
    end

    it "should show the user login page" do
        @login_page.open
    end

    it "should log in as a regular user" do
        @login_page.login_as
    end

    it "should show the home page" do
        @login_page.home_page
    end
 
    after :all do
        @login_page.close
    end
end