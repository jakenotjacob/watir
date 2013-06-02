require 'page'
require 'watir'
require 'rspec'
require 'yaml'

class Locations

    include Page 

    @@CONFIG = YAML::load_file('../fixtures/locations.yaml')

    def initialize(browser)
        @browser = browser
        @browser.window.move_to(0, 0)
        @browser.window.resize_to(1024, 900)
        @URL = URL + '#locations'
        ###
        @name = @browser.text_field(:id, 'nameInput')
        @addressLine1 = @browser.text_field(:id => 'addressInput')
        @addressLine2 = @browser.text_field(:id => 'address2Input')
        @city = @browser.text_field(:id => 'cityInput')
        @state = @browser.text_field(:id => 'stateInput')
        @zipCode = @browser.text_field(:id => 'zipInput')
        @phoneNumber = @browser.select_list(:id => 'didInput') 
        @sevenDigitDial = @browser.select_list(:id => 'sevenDigitDialInput')
        @areaCode = @browser.text_field(:id => 'areaCodeInput')
        @exitVoicemailApp = @browser.select_list(:name => 'exitapp')
        @exitAppOption = @browser.text_field(:name, 'exitname')
    end

    def create_new
        @browser.div(:id => 'leftbar').wait_until_present
        @browser.a(:href => '#locations/new').click
        # => This needs to be checked for future compatability(legend&text)
        @browser.legend(:text => 'Create New Location').wait_until_present
    end

    #Setting Form Data

    def set_name
        name = @@CONFIG[:name]
        @name.set(name)
    end

    def set_address
        line1 = @@CONFIG[:address][:line1]
        line2 = @@CONFIG[:address][:line2]
        city = @@CONFIG[:address][:city]
        state = @@CONFIG[:address][:state]
        zipCode = @@CONFIG[:address][:zipCode]

        @addressLine1.set(line1)
        @addressLine2.set(line2)
        @city.set(city)
        @state.set(state)
        @zipCode.set(zipCode)
    end

    def set_phoneNum
        phoneNum = @@CONFIG[:phoneNum]
        @phoneNumber.select(phoneNum)
    end

    def set_sevenDigit
        sevenDigit = @@CONFIG[:allow7Digit]
        @sevenDigitDial.select(sevenDigit)
    end

    def set_areaCode
        ac = @@CONFIG[:areaCode]
        @areaCode.set(ac)
    end
    ###

    def set_exitApp
        exitApp = @@CONFIG[:exitApp]
        @exitVoicemailApp.select(exitApp)
    end

    def set_exitAppOption
        no_fields = ['Directory', 'Fax Detection', 'Text To Speech', 'Check Voicemail']
        dropdown_fields = ['Call Flow', 'Call Group', 'Extension', 'Queue', 'Recording', 'Auto Attendant']
        text_fields = ['Call Forwarding']

        exitApp = @@CONFIG[:exitApp]
        exitOption = @@CONFIG[:exitOption]

        if text_fields.include? exitApp
            @exitAppOption.wait_until_present
            @exitAppOption.set(exitOption)
        elsif dropdown_fields.include? exitApp
            @exitAppOption.wait_until_present
            @exitAppOption.select(exitOption)
        elsif no_fields.include? exitApp
            print "Application takes no parameters"
            return true
        else
            print "Exit Voicemail Application not recognized."
            return true
        end

        puts "Exit App is: #{exitApp}"

        #voicemail=> VoiceMailBox dropdown, Arguments textfield 
    end
end # LocationPage