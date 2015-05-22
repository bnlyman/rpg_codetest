module Rbrpg
  module SkillTrees
    class Tree < SimpleDelegator
      def initialize
        build_tree
      end

      def __getobj__
        skills
      end

      def build_tree
        skills
      end

      def choose(skill_class)
        skills.detect{|skill| skill == skill_class }
      end

      def skills
        @skills ||= [
          ::Rbrpg::CharacterAbilities::BasicAttack
        ]
      end
    end
  end
end
