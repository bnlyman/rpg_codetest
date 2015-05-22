module Rbrpg
  module Decorated
    extend ::ActiveSupport::Concern

    def display_name

      # try(:name){|str| str.demodulize.titleize } || self.class.name
      self.class.name
    end

    module ClassMethods
      def display_name
        name.demodulize.titleize
      end
    end
  end
end
