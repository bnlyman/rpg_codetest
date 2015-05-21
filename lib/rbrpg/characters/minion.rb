module Rbrpg
  module Characters
    class Monster < Character
      def self.default_attributes
        {
          :health => 100,
          :level => 10,
          :experience_point_reward => 0
        }
      end
    end
  end
end
