module Rbrpg
  module DamageTypes
    class Damage < SimpleDelegator
      def initialize(amount, type:)
        @amount = amount
        @type = type
      end

      def __getobj__
        @amount
      end
    end
  end
end
