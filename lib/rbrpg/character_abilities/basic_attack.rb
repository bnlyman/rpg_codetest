module Rbrpg
  module CharacterAbilities
    class BasicAttack < Ability
      include ::Rbrpg::Decorated
      include ::Rbrpg::CharacterAbilities::Traits::DealsDamage

      def initialize(*args)
        super(*args)
        @description ||= "#{source.display_name}, hits #{target.display_name} for #{damage}"
      end

      def damage_source
        @source.weapon
      end
    end
  end
end
