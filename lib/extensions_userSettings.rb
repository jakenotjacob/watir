require 'watir-webdriver'
require 'yaml'
require 'extensions'

class UserSettings
    #,desc,loc,email,ringDur,moh,extCid,cidName,hide,receiveFax,attachFax

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

        #city = @@CONFIG[:address][:city]
        #state = @@CONFIG[:address][:state]
        #zipCode = @@CONFIG[:address][:zipCode]

    #def setFields(config_file)
    #    CFG = config_file
    #    @extNum.set(CFG userSettings['extensionNumber'])
    #    @fName.set(CFG['userSettings']['firstName'])
    #    @lName.set(CFG['userSettings']['lastName'])
    #end

    def print_vals
        puts "The value of firstName is #{@fName}"
    end
end
#
#        @addressLine1.set(line1)
#        @addressLine2.set(line2)