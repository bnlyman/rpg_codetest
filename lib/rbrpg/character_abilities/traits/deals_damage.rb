module Rbrpg
  module CharacterAbilities
    module Traits
      module DealsDamage
        extend ::ActiveSupport::Concern

        def damage_amount
          @damage_amount ||= damage_source.roll_damage
        end

        def resolve
          @resolve ||= target.apply_damage(damage_amount)
        end
      end
    end
  end
end
