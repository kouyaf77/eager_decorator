require "active_record"
require "action_controller/railtie"
require "action_view/railtie"

# model
class User < ActiveRecord::Base; end

# migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:users) {|t| t.string :name}
  end
end

# config
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
module EagerDecoratorTestApp
  class Application < Rails::Application
    config.root = "spec/dummy"
    config.secret_token = "confusion will be my epitaph."
    config.session_store :cookie_store, :key => "_myapp_session"
    config.active_support.deprecation = :log
    config.eager_load = false
    config.action_dispatch.show_exceptions = false
  end
end
EagerDecoratorTestApp::Application.initialize!
