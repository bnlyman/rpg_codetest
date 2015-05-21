require 'matrix'
require 'colored'

module Rbrpg
  class Log < SimpleDelegator

    def initialize
      @actions ||= []
    end

    def screen
      Screen[
        RepeatingRow.new("."),
        *actions.map(&:to_s)
      ]
    end

    def __getobj__
      @actions
    end

    def to_s
      screen.to_s
    end

    class Screen < Matrix
      def to_s
        rows.map(&:join)
      end
    end

    class Row < String
      LENGTH = 64

      def initialize(*tokens)
        if tokens.length && tokens.is_a?(Array)
          @chars = tokens.join('')

          if @chars.length > LENGTH
            @chars = @chars[1..LENGTH]
          elsif @chars.length < LENGTH
            offset = LENGTH - @chars.length
            offset.times do |i|
              @chars << " "
            end
          end

          @chars
        else
          @chars = tokens
        end

        super(@chars)
      end

      def to_ary
        self.chars.to_a
      end
    end

    class RepeatingRow < Row
      def initialize(pattern)
        self.class.superclass::LENGTH.times.map do |str|
          self << pattern
        end

        binding.pry

        self[0..self.class.superclass::LENGTH]
      end
    end
  end
end
