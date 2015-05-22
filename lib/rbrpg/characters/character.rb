module Rbrpg
  module Characters
    class Character
      include ::Rbrpg::Decorate
      
      def self.default_properties
        {
          :health => 100,
          :experience_points => 0
        }
      end

      def self.inherited(subklass)
        super(subklass)
        subklass.__send__("attr_reader", *subklass.default_properties.keys)
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
        health -= damage
      end

      def apply_experience

      end

      def dead?
        !alive?
      end
    end
  end
end
