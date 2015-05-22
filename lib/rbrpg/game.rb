module Rbrpg
  class Game
    COMPUTER_HERO_TYPE = :necromancer

    class << self
      attr_accessor :current
    end

    def self.start
      player_name = ask("Whats your name?") { |q| q.default = "Maximus" }

      selected_hero_type = choose do |menu|
        menu.prompt = "Choose a hero class"
        menu.choice(:warrior, :mage) { |type|
          say("Welcome #{type}!")
          type
        }
      end

      @current = new(
        build_player(player_name, selected_hero_type),
        build_computer('Computer', COMPUTER_HERO_TYPE)
      )

      @current.start
    end

    def self.build_player(player_name, hero_type)
      ::Rbrpg::Player.new(name: player_name, hero_type: hero_type)
    end

    def self.build_computer(player_name, hero_type)
      ::Rbrpg::Computer.new(name: player_name, hero_type: hero_type)
    end

    attr_accessor :player, :computer, :log, :display, :current_turn

    def initialize(player, computer)
      @player = player
      @computer = computer
      @log = ::Rbrpg::Log.instance
    end

    def finished?
      @player.health < 1 || @computer.health < 1
    end

    def start_turn
      turns << Turn.start
    end

    def start
      @display = ::Rbrpg::Renderer.new
      @display.clear
      @display.draw

      start_turn
    end

    def turns
      @turns ||= []
    end
  end
end
