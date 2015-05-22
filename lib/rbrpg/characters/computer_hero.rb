module Rbrpg
  module Characters
    class ComputerHero < Hero
      def self.default_properties
        {
          :experience_point_reward => 20_000
        }
      end

      def abilities
        @abilities ||= "rbrpg/skill_trees/#{self.class.name.demodulize.underscore}".classify.constantize.new
      end
    end
  end
end
