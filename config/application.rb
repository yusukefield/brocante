require_relative 'boot'

require 'rails/all'
require 'devise'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Brocante
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.load_defaults 5.2
    # to auto load lib/ directory
    config.autoload_paths += %W(#{config.root}/lib)# ライブラリをアプリ立ち上げ時に呼び込む
    config.eager_load_paths += %W(#{Rails.root}/lib)# 本番環境時においてlibを読み込む(必須!)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
