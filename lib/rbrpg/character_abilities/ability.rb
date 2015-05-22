module Rbrpg
  module CharacterAbilities
    class Ability < SimpleDelegator
      def initialize(source, target)
        @source = source
        @target = target

        resolve
      end

      def __getobj__
        description
      end
    end
  end
end
