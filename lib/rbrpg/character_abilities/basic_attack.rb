module Rbrpg
  module CharacterAbilities
    class BasicAttack
      include ::Rbrpg::CharacterAbilities::Traits::DealsDamage

      def damage_source
        @source.weapon
      end

      def description
        @description ||= "#{source.name}, hits #{target.name} for #{damage.amount}"
      end
    end
  end
end
