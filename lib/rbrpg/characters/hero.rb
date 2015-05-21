module Rbrpg
  module Characters
    class Hero < Character

      class << self
        attr_accessor :equipment, :inventory
      end

      def initialize

      end
    end
  end
end
