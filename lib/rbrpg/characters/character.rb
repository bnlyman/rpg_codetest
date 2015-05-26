module Rbrpg
  module Characters
    class Character
      include ::Rbrpg::Decorated
      include ::Observable

      attr_accessor :health, :experience_points

      def initialize
        @health ||= 100
      end

      def alive?
        health
      end

      def apply_damage(damage)
        binding.pry
        self.health = (self.health - damage)
        notify_observers(self, damage, [self.display_name, "was", "hit", "for", damage].join(" "))
        self
      end

      def apply_healing
        self.health = (self.health + healing)
        notify_observers(self, healing, [self.display_name, "was", "healed", "for", healing].join(" "))
        self
      end

      def cast(ability_class, target:)
        ability_class.new(self, target)
        changed(true)
        notify_observers(self, :cast, [self.display_name, "casts", ability_class.display_name, "at", target].join(" "))
      end

      ### the changed & notify_observers methods  come from the observable module
      #http://ruby-doc.org/stdlib-1.9.3/libdoc/observer/rdoc/Observable.html
      def health=(new_value)
        change_amount = health - new_value
        changed(true)
        @health = new_value
        notify_observers(self, event_name, [self.display_name + "'s", "health", "is", "now", new_value].join(" "))
      end

      def apply_experience

      end

      def dead?
        !alive?
      end
    end
  end
end
