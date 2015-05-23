module Rbrpg
  module Equipment
    class Staff < Weapon
      def self.default_properties
        {
          :damage_low_amount => 5,
          :damage_high_amount => 25
        }
      end
    end
  end
end
