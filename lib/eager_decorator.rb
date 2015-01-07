require "singleton"
require "rails"
require "eager_decorator/version"
require "eager_decorator/railtie"

module EagerDecorator
  class Decorator
    include Singleton

    def initialize
      Dir.glob(Rails.root + "app/decorators/**/*.rb").each do |file|
        klass_name = File.basename(file, ".rb").sub /_decorator/, ""
        klass = klass_name.classify.safe_constantize
        decorator = "#{klass_name.classify}Decorator".safe_constantize
        klass.send(:include, decorator) if decorator
      end
    end
  end
end
