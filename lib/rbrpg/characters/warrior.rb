module Rbrpg
  module Characters
    class Warrior < PlayerHero
      def self.default_properties
        {
          :health => 12_500,
          :level => 1
        }
      end

      def weapon
        @weapon ||= ::Rbrpg::Equipment::Sword.new
      end
    end
  end
end
