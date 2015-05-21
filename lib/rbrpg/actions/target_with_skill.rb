module Rbrpg
  module Actions
    class TargetWithSkill < Action
      def to_s
        "#{@targeter} targets #{@target} with #{@description}"
      end

      def run

      end
    end
  end
end
