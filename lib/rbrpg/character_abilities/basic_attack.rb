require 'rbrpg/decorated'
require 'rbrpg/character_abilities/traits/deals_damage'

module Rbrpg
  module CharacterAbilities
    class BasicAttack < Ability
      include ::Rbrpg::Decorated
      include ::Rbrpg::CharacterAbilities::Traits::DealsDamage

      def initialize(*args)
        super(*args)
      end

      def damage_source
        @source.weapon
      end
    end
  end
end
