module Rbrpg
  class ApplyDamage < Action
    def run
      @target.apply_damage(@amount)
    end
  end
end
