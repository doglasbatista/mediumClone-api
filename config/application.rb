require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MediumCloneApi
  class Application < Rails::Application
    config.i18n.default_locale = :en

    config.i18n.load_path += Dir[File.join(Rails.root, 'config', 'locales', '**', '*.{rb,yml}')]
    config.active_record.raise_in_transactional_callbacks = true
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => 'http://localhost:3001',
      'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }
  end
end
