module Rbrpg
  module Characters
    class Warrior < Hero
      def initialize
        @health = 12_500

        super
      end

      def weapon
        @weapon ||= ::Rbrpg::Equipment::Sword.new
      end
    end
  end
end
