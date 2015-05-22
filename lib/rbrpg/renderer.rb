require 'matrix'
require 'colored'

module Rbrpg
  class Renderer
    attr_reader :game
    def initialize
      @log_line_observer = LogLineObserver.new
      @game = ::Rbrpg::Game.current
    end

    def screen(rows_to_append = [])
      @screen ||= Screen[
        RepeatingRow.new("-"),
        Row.new("- CURRENT TURN: ##{game.try(:current_turn).try(:number).try(:red)}"),
        # Row.new("- #{game.player.name}:", game.player.hero.health),
        RepeatingRow.new("-"),
        RepeatingRow.new(" "),
        RepeatingRow.new("-"),
        Row.new("- PLAYER: #{game.player.name.red} - #{game.player.hero.class.name.demodulize.green}"),
        Row.new("- #{game.player.name}:", game.player.hero.health),
        RepeatingRow.new("-"),
        RepeatingRow.new(" ")
      ]
    end

    def clear
      system "clear" or system "cls"
    end

    def draw
      puts screen.to_s
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

        self[0..self.class.superclass::LENGTH]
      end
    end

    class LogLineObserver
      def initialize
        ::Rbrpg::Log.instance.add_observer(self)
      end

      def update(*args)
        # Rbrpg::Renderer.draw
        args.map(&:puts)
      end
    end
  end
end
