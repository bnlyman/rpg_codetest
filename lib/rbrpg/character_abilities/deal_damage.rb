module Rbrpg
  module CharacterAbilities
    class DealDamage < Ability
      def damage_amount
        @damage_amount ||= damage_source.roll_damage
      end

      def resolve
        @target.apply_damage(damage_amount)
      end
    end
  end
end
