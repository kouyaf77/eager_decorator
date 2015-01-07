module EagerDecorator
  class Railtie < ::Rails::Railtie
    initializer "eager_decorator" do
      config.to_prepare do
        EagerDecorator::Decorator.instance
      end
    end
  end
end
