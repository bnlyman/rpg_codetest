module Rbrpg
  module CharacterAbilities
    class DealDamage < Ability
      def damage_amount
        @damage_amount ||= damage_source.roll_damage
      end

      def resolve
        @resolve ||= ::Rbrpg::Actions::ApplyDamage.new(targeter, target, damage_amount)
      end
    end
  end
end
