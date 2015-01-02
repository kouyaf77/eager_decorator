require "rails"

module EagerDecorator
  class Railtie < ::Rails::Railtie
    initializer "eager_decorator" do
      EagerDecorator::Decorator.instance
    end
  end
end
