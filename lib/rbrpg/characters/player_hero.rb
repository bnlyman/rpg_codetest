module Rbrpg
  module Characters
    class PlayerHero
      def self.default_attributes
        {
          :health => 12_500,
          :levels => Rbrpg::CharacterLevel.level_range
        }
      end

      def level_up!

      end

      def leveled_up?

      end
    end
  end
end
