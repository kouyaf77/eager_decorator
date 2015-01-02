require "singleton"

module EagerDecorator
  class Decorator
    include Singleton

    def initialize
      path = "#{Rails.root}/app/decorators/**/*.rb"

      Dir.glob(path).each do |file|
        model_name = File.basename(file, ".rb").sub(/_decorator/, "")
        model = model_name.classify.constantize rescue nil
        unless model.nil?
          model.send(:include, "#{model_name.classify}Decorator".constantize)
        end
      end
    end
  end
end
