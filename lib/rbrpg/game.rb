module Rbrpg
  class Game
    COMPUTER_HERO_TYPE = :necromancer

    attr_accessor :player, :computer

    def self.start
      player_name = ask("Whats your name?") { |q| q.default = "Maximus" }

      selected_hero_type = choose do |menu|
        menu.prompt = "Choose a hero class"
        menu.choice(:warrior, :mage) { |type|
          say("Welcome #{type}!")
          type
        }
      end

      new(
        build_player(player_name, selected_hero_type),
        build_computer('Megatron', COMPUTER_HERO_TYPE)
      )
    end

    def self.build_player(player_name, hero_type)
      ::Rbrpg::Player.new(name: player_name, hero_type: hero_type)
    end

    def self.build_computer(player_name, hero_type)
      ::Rbrpg::Computer.new(name: player_name, hero_type: hero_type)
    end

    attr_accessor :current_turn

    def initialize(player, computer)
      @player = player
      @computer = computer
      @log =
      @display = ::Rbrpg::Renderer.new(self)
      @turn = Turn.start!(self)
    end

    def finished?
      @player.health < 1 || @computer.health < 1
    end
  end
end
