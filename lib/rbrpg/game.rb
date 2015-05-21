module Rbrpg
  class Game
    attr_accessor :player, :computer

    def self.start
      player_name = ask("Whats your name?") { |q| q.default = "Maximus" }

      hero_class = choose do |menu|
        menu.prompt = "Choose a hero class"
        menu.choice(:warrior, :mage) { |type| say("Welcome #{type}!") }
      end

      new(
        build_player(player_name, hero_class),
        build_computer('R2D4', hero_class)
      )
    end

    def self.build_player(player_name, hero_class)
      ::Rbrpg::Player.new(player_name, hero_class)
    end

    def self.build_computer(player_name, hero_class)
      ::Rbrpg::Computer.new(player_name, hero_class)
    end

    attr_accessor :current_turn

    def initialize(player, computer)
      @player = player
      @computer = computer
      @current_turn = 0

      @display = ::Rbrpg::Renderer.new(self)
      start_turn
    end

    def turns
      @turns ||= []
    end

    def start_turn
      @current_turn += 1
      turns.push(Turn.new(@current_turn))
    end
  end
end
