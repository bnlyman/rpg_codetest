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
        log.phase_changed("Player Action Phase Begin")

        chosen_ability = choose do |menu|
          menu.prompt = "Choose an ability"

          choice = menu.choices(*::Rbrpg::Game.current.player.hero.abilities) { |ability|
            ability
          }
          choice
        end

        chosen_target = choose do |menu|
          menu.prompt = "Select target for #{chosen_ability.display_name}"
          choice = menu.choices(*::Rbrpg::Game.current.computer.valid_targets) { |target|
            log.say(["Targeting", chosen_ability.display_name, "with", target.display_name])
            target
          }
        end

        ::Rbrpg::Game.current.player.hero.cast(chosen_ability, :target => chosen_target)

        actions.map(&:resolve)
      end

      def finish
        log.phase_changed("Player Action Phase End")
      end
    end

    class ComputerActionPhase < Phase
      def start
        log.phase_changed("Computer Action Phase Begin")

        chosen_ability = ::Rbrpg::Game.current.computer.hero.abilities[0]
        chosen_target = ::Rbrpg::Game.current.player.valid_targets[0]
        ::Rbrpg::Game.current.computer.hero.cast(chosen_ability, :target => chosen_target)

        actions.map(&:resolve)
      end

      def finish
        log.phase_changed("Computer Action Phase End")
      end
    end
  end
end
