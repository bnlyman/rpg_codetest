module Rbrpg
  module Equipment
    class Shield < Weapon
      def self.default_properties
        {
          :damage_low_amount => 20,
          :damage_high_amount => 30
        }
      end
    end
  end
end