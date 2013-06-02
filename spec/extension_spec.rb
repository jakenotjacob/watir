require '../lib/extensions'
require 'watir'
require 'rspec'
require 'yaml'

describe "Extensions" do

    before :all do
        @extension_page = Extensions.new(Watir::Browser.new :chrome)
        @extension_page.open.login_as
        @extension_page.open
    end

    it 'should show the Create New Extension page' do
        @extension_page.create_new
    end

    describe "the User Settings Tab" do

        it "should set the Extension Number" do
            @extension_page.fill_extensions
        end
    end

    after :all do
        @extension_page.close
    end
end