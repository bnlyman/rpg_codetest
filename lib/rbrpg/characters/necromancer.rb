module Rbrpg
  module Characters
    class Necromancer < ComputerHero
      def self.default_properties
        {
          :health => 100_000,
          :experience_point_reward => 20_000
        }
      end

      def weapon
        @weapon ||= ::Rbrpg::Equipment::Staff.new
      end
    end
  end
end
