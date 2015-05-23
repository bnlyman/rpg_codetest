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
        self.health = (self.health - damage)

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
        event_name = ((new_value > health) ? :healed : :hit)
        changed(true)
        @health = new_value
        notify_observers(self, event_name, [self.display_name, "was", event_name, "for", change_amount].join(" "))
      end

      def apply_experience

      end

      def dead?
        !alive?
      end
    end
  end
end
