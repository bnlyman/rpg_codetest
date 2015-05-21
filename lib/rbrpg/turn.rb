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
      @phases ||= {
        :target => TargetPhase,
        :attack => AttackPhase
      }
    end

    def self.next_turn_number
      turns.last.number + 1
    end

    def self.start!(game)
      @game = game

      new(1)
    end

    def self.build_turn_phases
      self.class.phases.dup.transform_values!{|klass|
        klass.new()
      }
    end

    attr_accessor :number, :phases


    def initialize(turn_number)
      @number = turn_number

      @phases = self.class.phases.dup.transform_values!{|klass|
        klass.new(self)
      }

      @current_phase = @phases[:target]

      @phases[:target].resolve

      @current_phase = @phases[:attack]

      @phases[:attack].resolve
    end

    def game
      self.class.game
    end

    class Phase
      def initialize(turn)
        @turn = turn

        on_begin
        on_end
      end

      def actions
        @actions ||= []
      end

      def resolve
        actions.map(&:resolve)
      end
    end

    class AttackPhase < Phase
      def on_begin
        puts "Attack Phase Begin"

        @turn.phases[:target].actions.each do |action|
          @actions << action.resolve
        end
      end

      def on_end
        puts "Attack Phase End"

      end
    end

    class TargetPhase < Phase
      def on_begin
        puts "Target Phase Begin"
        choose do |menu|
          menu.prompt = "Choose a target"
          chosen_target = menu.choice(@turn.game.computer.valid_targets) { |target|
            say("Targeting #{target.class.name.demodulize}")
            target
          }

        end

        choose do |menu|
          menu.prompt = "Choose an ability"
          chosen_ability = menu.choice(@turn.game.player.hero.abilities) { |ability|
            say("With #{ability.class.name.demodulize}")
            ability
          }
        end

        @actions << ::Rbrpg::Actions::TargetWithSkill.new(targeter: self.class.game.player.hero, target: chosen_target, description: ability.class.name.demodulize)
      end

      def on_end
        puts "Target Phase End"

      end
    end

  end
end
