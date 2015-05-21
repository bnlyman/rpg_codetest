module Rbrpg
  class Turn
    attr_accessor :number

    class << self
      attr_accessor :game
    end

    def self.current
      turns.last
    end

    def self.end!
      turns << new(next_turn_number)
    end

    def self.turns
      @turns ||= []
    end

    def self.phases
      @phases ||= [
        ::TargetPhase,
        ::AttackPhase
      ]
    end

    def self.next_turn_number
      turns.last.number + 1
    end

    def self.start!(game)
      @game = game
    end

    def initialize(turn_number)
      @number = turn_number
      @phase = Phases.first
    end

    class Phase
      def initialize
        on_begin
        on_end
      end

      def actions
        @actions ||= []
      end
    end

    class TargetPhase < Phase
      def on_begin
        choose do |menu|
          menu.prompt = "Choose a target"
          chosen_target = menu.choice(game.computer.valid_targets) { |target|
            say("Targeting #{target.class.name.demodulize}")
            target
          end

          chosen_ability = menu.choice(game.player.available_abilities) { |ability|
            say("Targeting #{target.class.name.demodulize}")
            target
          end



        end
      end
    end

    def phases

    end
  end
end
