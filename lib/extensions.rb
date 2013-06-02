require 'page'
require 'watir-webdriver'
require 'yaml'

module Extensions
    include Page

    CFG = YAML::load_file('../fixtures/extensions.yaml')
    @URL = URL + '#extensions'

    def create_new
        @browser.div(:id => 'leftbar').wait_until_present
        @browser.a(:href => '#extensions/new').click
        # => This needs to be checked for future compatability
        @browser.div(:id, 'myTabContent').wait_until_present
    end

    class UserSettings
        
        def initialize(browser)
            @extNum = @browser.text_field(:id => 'newExten')
            @fName = @browser.text_field(:id => 'fname')
            @fName = @browser.text_field(:id => 'lname')
        end

        def get_configVals(configFile)
            config['userSetting'].each { |setting|
                puts setting
            }
        end

        def print_vals
            puts "The value of firstName is #{@fName}"
        end
    end
    
    @settings_tab = UserSettings.new(@browser)

    def fill_userSettings
        @settings_tab.get_configVals(CFG)
    end
end