module Rbrpg
  module Characters
    class Character
      include ::Rbrpg::Decorated

      def self.default_properties
        {
          :health => 100,
          :experience_points => 0
        }
      end

      def self.inherited(subklass)
        super(subklass)
        subklass.__send__("attr_accessor", *subklass.default_properties.keys) if subklass.respond_to?(:default_properties)
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
        self.health -= damage
        binding.pry
        self
      end

      def cast(ability_class, target:)
        ability_class.new(self, target)
      end

      def apply_experience

      end

      def dead?
        !alive?
      end
    end
  end
end
