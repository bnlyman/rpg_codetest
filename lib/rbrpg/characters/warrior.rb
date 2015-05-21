module Rbrpg
  module Characters
    class Warrior < Hero
      def self.default_attributes
        {
          :health => 12_500,
          :level => 1
        }
      end

      def abilities
        [ ::Rbrpg::CharacterAbilities::BasicAttack ]
      end

    end
  end
end
