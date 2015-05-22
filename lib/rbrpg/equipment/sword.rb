module Rbrpg
  module Equipment
    class Sword < Weapon
      def self.default_properties
        {
          :damage_low_amount => 10,
          :damage_high_amount => 20
        }
      end
    end
  end
end
