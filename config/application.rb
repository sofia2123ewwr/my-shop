require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MyShop
  class Application < Rails::Application
    config.load_defaults 7.0
    config.assets.precompile += %w(application.css)
  end
end
