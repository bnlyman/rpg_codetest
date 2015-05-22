module Rbrpg
  module SkillTrees
    class Warrior < ::Rbrpg::SkillTrees::Tree
      def skills
        super + [
          ::Rbrpg::CharacterAbilities::BasicAttack
        ]
      end
    end
  end
end
