module Rbrpg
  module Characters
    class ComputerHero < Hero
      def self.default_attributes
        {
          :experience_point_reward => 20_000
        }
      end
    end
  end
end
