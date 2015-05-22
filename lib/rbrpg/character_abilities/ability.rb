module Rbrpg
  module CharacterAbilities
    class Ability < SimpleDelegator
      include ::Rbrpg::Decorated

      attr_accessor :source, :target

      def initialize(source, target)
        @source = source
        @target = target
        resolve
      end

      def __getobj__
        @description
      end
    end
  end
end
