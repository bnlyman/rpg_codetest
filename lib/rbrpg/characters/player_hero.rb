module Rbrpg
  module Characters
    class PlayerHero < Hero
      def self.default_properties
        {
          :health => 12_500,
          :levels => ::Rbrpg::CharacterLevel.level_range
        }
      end

      def abilities
        @abilities ||= "rbrpg/skill_trees/#{self.class.name.demodulize.underscore}".classify.constantize.new
      end

      def level_up!

      end

      def leveled_up?

      end
    end
  end
end
