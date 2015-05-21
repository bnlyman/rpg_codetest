module Rbrpg
  class Renderer
    attr_accessor :game

    def initialize(game)
      @game = game
    end

    def screen
      @screen ||= Matrix[
        Row.new("PLAYER: #{game.player.hero.name}"),
        Row.new(game.player),
        Row.new("#{game.player.hero.name}: ", ":", game.player.hero.health),
        Row.new
        # Row.new("Turn number: #{game.turn.number}"),
        # Row.new,
      ]
    end

    def draw
      system "clear" or syetem "cls"
      puts screen
    end

    class Row < String
      MAX_LENGTH = 16

      def initialize(*tokens)
        if tokens.length
          @chars = @tokens.join('')

          if @chars > MAX_LENGTH
            @chars = @chars[0..MAX_LENGTH]
          elsif @chars < MAX_LENGTH
            offset = LENGTH - @chars
            @chars.tap do
              offset.times do |i|
                self << ""
              end
            end
          end

          @chars
        end
      end
    end
  end
end
