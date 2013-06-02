require 'watir-webdriver'
require 'rspec'
require 'yaml'

module VoicemailBoxes

    @@global_config = YAML::load_file('../fixtures/global.yaml')
    @@voicemail_config = YAML::load_file('../fixtures/voicemailboxes.yaml')
    URL = @@global_config[:url]

    def initialize(browser)
        @browser = browser
        @browser.window.move_to(0, 0)
        @browser.window.resize_to(1024, 768)
        @URL = URL + '#voicemailboxes'
    end

    class Options
        include VoicemailBoxes

        @mailboxNumber = @browser.text_field(:id, 'mailboxInput')

        def self.print
            puts "Hello"
        end
    end

    class Notifications
        def self.print
            puts "Hello"
        end
    end


    class Settings
        def self.print
            puts "Hello"
        end
    end
end

x = VoicemailBoxes
x::Settings.print


=begin
    
module A 
  module ClassMethods
    def say_hi
      puts "hi"
    end
  end
  extend ClassMethods
  def self.included( other )
    other.extend( ClassMethods )
  end
end

=end