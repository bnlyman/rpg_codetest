module Rbrpg
  module CharacterAbilities
    class Ability
      attr_reader :log

      def initialize(targeter, target)
        @targeter = targeter
        @target = target
        @log = []

        resolve
      end

      def cast_text
        @cast_text ||= "#{@targeter.display_name} targets #{target.display_name} with #{self.display_name}"
      end

      def resolve
        log << cast_text
        log << @outcome = cast_resolution
      end


      def to_s
        log.map(&:join)
      end
    end
  end
end
