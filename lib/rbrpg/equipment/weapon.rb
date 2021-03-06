module Rbrpg
  module Equipment
    class Weapon < Item
      include ::Rbrpg::Decorated

      def self.default_properties
        {
          :damage_low_amount => 10,
          :damage_high_amount => 20
        }
      end

      def initialize
        self.class.default_properties.each_pair do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end

      def roll_damage
        damage_range[rand(damage_range.length)]
      end

      private

      def damage_range
        @damage_range ||= (@damage_low_amount..@damage_high_amount).to_a
      end
    end
  end
end
