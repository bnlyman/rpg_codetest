module Rbrpg
  module Characters
    class Character
      attr_accessor :health

      def initialize(health: 100)
        @health = health
      end

      def alive?
        @health
      end

      def dead?
        !alive?
      end
    end
  end
end
