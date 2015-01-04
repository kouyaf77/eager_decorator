module EagerDecorator
  class Hooks
    class << self
      def init
        ActiveSupport.on_load(:active_record) do
          ::ActiveRecord::Base.send(:include, EagerDecorator)
        end
      end
    end
  end
end
