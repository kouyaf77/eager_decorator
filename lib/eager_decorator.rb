require "eager_decorator/version"
require "singleton"

module EagerDecorator
  class Decorator
    include Singleton

    PATH = "#{Rails.root}/app/decorators/**/*.rb"

    def initialize
      Dir.glob(PATH).each do |file|
        class_name= File.basename(file, ".rb").sub(/_decorator/, "")
        constant = class_name.classify.constantize rescue nil
        unless constant.nil?
          constant.send :include, "#{class_name.classify}Decorator".constantize
        end
      end
    end
  end
end
