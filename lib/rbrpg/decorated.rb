module Rbrpg
  module Decorated
    extend ::ActiveSupport::Concern

    def display_name
      self.class.display_name
    end

    module ClassMethods
      def display_name
        name.demodulize.titleize
      end
    end
  end
end
