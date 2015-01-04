module EagerDecorator
  class Railtie < ::Rails::Railtie
    initializer "eager_decorator" do
      EagerDecorator::Hooks.init
    end
  end
end
