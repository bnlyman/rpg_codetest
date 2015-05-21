module Rbrpg
  module Characters
    class Necromancer < ComputerHero
      def self.default_attributes
        {
          :health => 100_000,
          :experience_point_reward => 20_000
        }
      end
    end
  end
end
