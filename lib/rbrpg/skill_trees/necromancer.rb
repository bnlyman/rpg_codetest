module Rbrpg
  module SkillTrees
    class Necromancer < ::Rbrpg::SkillTrees::Tree
      def skills
        super + [
          ::Rbrpg::CharacterAbilities::BasicAttack
        ]
      end
    end
  end
end
