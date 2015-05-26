require 'rbrpg/decorated'
require 'rbrpg/character_abilities/traits/consumes_mana'
require 'rbrpg/character_abilities/traits/deals_damage'

module Rbrpg
  module CharacterAbilities
    class Bash < Ability
      include ::Rbrpg::Decorated
      include ::Rbrpg::CharacterAbilities::Traits::ConsumesMana
      include ::Rbrpg::CharacterAbilities::Traits::DealsDamage

      def initialize(*args)
        super(*args)
      end

      def mana_cost
        20
      end

      def damage_source
        @source.weapon
      end
    end
  end
end
