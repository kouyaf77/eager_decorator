require "singleton"

module EagerDecorator
  class Decorator
    include Singleton

    def initialize
      path = "#{Rails.root}/app/decorators/**/*.rb}"

      Dir.glob(path).each do |file|
        decorator_name = File.basename(file, ".rb").sub(/_decorator/, "")
        model = class_name.classify.constantize rescue nil
        unless model.nil?
          model.send(:include, "#{decorator_name.classify}Decorator".constantize)
        end
      end
    end
  end
end
