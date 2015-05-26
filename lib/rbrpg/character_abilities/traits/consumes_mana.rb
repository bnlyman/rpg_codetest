module Rbrpg
  module CharacterAbilities
    module Traits
      module ConsumesMana
        extend ::ActiveSupport::Concern

        def mana_amount
          @mana_amount ||= mana_amount
        end

        def resolve
          @resolve ||= target.consume_mana(mana_amount)
        end
      end
    end
  end
end
