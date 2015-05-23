require 'matrix'
require 'colored'

module Rbrpg
  class Renderer
    attr_reader :game
    def initialize
      @game_state_observer = GameStateObserver.new
      @game = ::Rbrpg::Game.current
    end

    def screen
      [
        RepeatingRow.new("-"),
        Row.new("- CURRENT TURN: #{'#'.yellow} #{game.current_turn_number.to_s.red}"),
        RepeatingRow.new("-"),
        Row.new("- PLAYER: #{game.player.name.red} - #{game.player.hero.display_name.green}"),
        Row.new("- HEALTH:", game.player.hero.health),
        RepeatingRow.new("-"),
        RepeatingRow.new(" "),
        Row.new("- Computer: #{game.computer.name.blue} - #{game.computer.hero.display_name.green}"),
        Row.new("- HEALTH:", game.computer.hero.health),
        RepeatingRow.new("-"),
        RepeatingRow.new(" "),
        RepeatingRow.new(" ")
      ].join("\n")
    end

    def clear
      system "clear" or system "cls"
    end

    def draw
      puts screen.to_s
    end

    class Row < String
      LENGTH = 86

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
  end
end
