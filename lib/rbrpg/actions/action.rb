module Rbrpg
  module Actions
    class Action
      def initialize(source:, target:, value:nil)
        @source = source
        @target = target
        @value = value

        run
      end
    end
  end
end
