require "rails"
require "eager_decorator/version"
require "eager_decorator/hooks"
require "eager_decorator/railtie"

module EagerDecorator
  extend ActiveSupport::Concern

  included do
    class << self
      def inherited_with_decorator(klass)
        decorator = "#{klass.name.classify}Decorator".safe_constantize
        klass.send(:include, decorator) if decorator
        inherited_without_decorator(klass)
      end
      alias_method_chain(:inherited, :decorator)
    end
  end
end
