require '../lib/voicemail-boxes'
require 'watir'
require 'rspec'
require 'yaml'

describe "Voicemail Boxes" do

    before :all do
        @voicemail_page = VoicemailBoxes.new(Watir::Browser.new :chrome)
    end
end
