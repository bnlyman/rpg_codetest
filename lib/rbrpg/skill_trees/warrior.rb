module Rbrpg
  module SkillTrees
    class Warrior < ::Rbrpg::SkillTrees::Tree
      def skills
        super + [
          ::Rbrpg::CharacterAbilities::BasicAttack,
          ::Rbrpg::CharacterAbilities::ShieldBash
        ]
      end
    end
  end
end
