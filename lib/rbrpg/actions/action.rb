module Rbrpg
  module Actions
    class Action
      def initializer(targeter:, target:, description:, value:nil)
        @targeter = targeter
        @target = target
        @description = description
        @value = value

        run
      end

      def to_s
        str = "#{@targeter} #{@description} #{@target}"
        str << "for #{@value}" if @value
        str
      end
    end
  end
end
