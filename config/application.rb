require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TriunfeiV2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('app', 'models', 'users')
    config.autoload_paths << Rails.root.join('app', 'services')
    config.i18n.default_locale = 'pt-BR'
    config.time_zone = 'Brasilia'

    config.active_job.queue_adapter = :async
  end
end
