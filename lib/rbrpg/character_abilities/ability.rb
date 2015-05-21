module Rbrpg
  module CharacterAbilities
    class Ability
      attr_reader :log

      def initialize(targeter, target)
        @targeter = targeter
        @target = target
        @log = []

        resolve_actions
      end

      def cast_text
        @cast_text ||= "#{@targeter.display_name} targets #{target.display_name} with #{self.display_name}"
      end

      def resolve_actions
        log << cast_text
        log << resolve.to_s
      end

      def to_s
        log.map(&:join)
      end
    end
  end
end
