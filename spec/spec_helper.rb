$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "rails"
require "eager_decorator"
require "dummy/config"
require "rspec/rails"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.before :all do
    unless ActiveRecord::Base.connection.table_exists?("users")
      CreateAllTables.up
    end
  end

  config.before :each do
    User.delete_all
  end
end
