module EagerDecorator
  class Railtie < ::Rails::Railtie
    initializer "eager_decorator" do
      config.to_prepare do
        EagerDecorator.decorate Rails.application.config.cache_classes
      end
    end
  end
end
