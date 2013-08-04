require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module OmmYo
  class Application < Rails::Application
    config.active_record.observers = :omm_courier
    config.to_prepare do
      Devise::SessionsController.layout 'guest'
      Devise::RegistrationsController.layout proc{ |c| user_signed_in? ? 'member' : 'guest' }
      Devise::ConfirmationsController.layout 'guest'
      Devise::UnlocksController.layout 'guest'
      Devise::PasswordsController.layout 'guest'
    end
  end
end
