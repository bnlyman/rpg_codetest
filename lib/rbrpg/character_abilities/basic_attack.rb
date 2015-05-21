module Rbrpg
  module CharacterAbilities
    class BasicAttack < DealDamage
      def damage_source
        @targeter.weapon
      end
    end
  end
end
