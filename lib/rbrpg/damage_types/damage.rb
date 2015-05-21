module Rbrpg
  module DamageTypes
    class Damage < SimpleDelegator
      def initialize(amount, type:)
        @amount = amount
        @type = type
      end
    end
  end
end
