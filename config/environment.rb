RAILS_GEM_VERSION = '2.0.991' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "RedCloth"
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_my_snippets_session',
    :secret      => '60b1a08f5a6a7a385143b64e67691edd7e37c5400d9131578bf1dee91163e1dcfebe83f896c618dcad83fb6bddc6d817169ec89b288f1ef66fccdd75a169c306'
  }
end

TagList.delimiter = ' '