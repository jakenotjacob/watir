require '../lib/locations'
require 'watir-webdriver'
require 'rspec'
require 'yaml'

describe "Locations" do

    before :all do
        @location_page = Locations.new(Watir::Browser.new :chrome)
    end

    it "should show the Location page" do
        @location_page.open.login_as
        @location_page.open
    end

    it "should show the Create New Location page" do
        @location_page.create_new
    end

    describe "the New Location form" do

        it "should set the Location Name" do
            @location_page.set_name
        end

        it "should enter the Location address information" do
            @location_page.set_address
        end

        it "should a phone number for E911" do
            @location_page.set_phoneNum
        end

        it "should select a 7 Digit Dialing option" do
            @location_page.set_sevenDigit
        end

        it "should enter the Area Code" do
            @location_page.set_areaCode
        end

        it "should select an Exit Voicemail Application" do
            @location_page.set_exitApp
            @location_page.set_exitAppOption
        end

        it "should submit the form" do
            @location_page.save
        end
    end
end