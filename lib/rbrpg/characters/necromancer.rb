module Rbrpg
  module Characters
    class Necromancer < Hero
      def initialize
        @health = 10000
        
        super
      end

      def weapon
        @weapon ||= ::Rbrpg::Equipment::Staff.new
      end
    end
  end
end
