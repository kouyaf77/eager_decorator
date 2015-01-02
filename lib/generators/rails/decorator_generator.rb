module Rails
  module Generators
    class DecoratorGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def create_decorator_file
        template("decorator.rb",
          File.join("app/decorators", "#{singular_name}_decorator.rb"))
      end
    end
  end
end
