module Rbrpg
  module Characters
    class Character
      include ::Rbrpg::Decorated
      include ::Observable

      def self.default_properties
        {
          :health => 100,
          :experience_points => 0
        }
      end

      def self.inherited(subklass)
        super(subklass)

        if subklass.respond_to?(:default_properties)
          subklass.default_properties.keys.each do |k|
            attr_reader(k)
            attr_writer "#{k}" unless subklass.instance_methods.include?("#{k}=")
          end
        end
      end

      def initialize
        self.class.default_properties.each_pair do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end

      def alive?
        @health
      end

      def apply_damage(damage)
        self.health= (self.health - damage)
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
        event_name = self.health > new_value ? :healed : :hit
        changed(true)
        super(new_value)
        notifiy_observers(self, event_name, [record.display_name, "was", event_name, "for", new_value].join(" "))
      end

      def apply_experience

      end

      def dead?
        !alive?
      end
    end
  end
end
