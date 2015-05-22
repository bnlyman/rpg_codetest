module Rbrpg
  class Turn
    class << self
      attr_accessor :current
    end

    def self.start
      next_turn = new(next_turn_number)
      instance_variable_set("@current", next_turn)
    end

    def self.phases
      @phases ||= {
        :player_action_phase => PlayerActionPhase,
        :computer_action_phase => ComputerActionPhase
      }
    end

    def self.next_turn_number
      ::Rbrpg::Game.try(:current).try(:number){|num| num + 1}  || 1
    end

    attr_accessor :number, :phases

    def initialize(turn_number)
      @number = turn_number

      @phases = self.class.phases.dup.transform_values!{|klass|
        klass.new
      }

      @current_phase = @phases[:player_action_phase].resolve
    end

    class Phase
      def initialize
        start
        finish
      end

      def actions
        @actions ||= []
      end

      def log
        @log ||= ::Rbrpg::Log.instance
      end

      def game
        @game ||= ::Rbrpg::Game.current
      end

      def resolve
        actions.map(&:resolve)
      end
    end

    class PlayerActionPhase < Phase
      def start
        log.say("Player Action Phase Begin")

        chosen_ability = choose do |menu|
          menu.prompt = "Choose an ability"

          choice = menu.choice(*::Rbrpg::Game.current.player.hero.abilities) { |ability|
            log.say("#{ability.class.name.demodulize}")
            ability
          }
          choice
        end

        binding.pry

        choose do |menu|
          menu.prompt = "Select target for #{chosen_ability.display_name}"
          chosen_target = menu.choice(*Rbrpg::Game.current.computer.valid_targets) { |target|
            log.say("Targeting #{chosen_ability.class.name.demodulize} with #{target.class.name.demodulize}")
            target
          }
        end

        actions.map(&:resolve)
      end

      def finish
        log.say("Player Action Phase End")
      end
    end

    class ComputerActionPhase < Phase
      def start
        log.say("Computer Action Phase Begin")

        choose do |menu|
          menu.prompt = "Choose an ability"
          chosen_ability = menu.choice(*::Rbrpg::Game.current.computer.hero.abilities) { |ability|
            log.say("#{ability.class.name.demodulize}")
            ability
          }
        end

        actions.map(&:resolve)
      end

      def finish
        log.say("Compiuter Action Phase End")
      end
    end


  end
end
