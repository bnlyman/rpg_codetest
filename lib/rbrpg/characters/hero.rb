module Rbrpg
  module Characters
    class Hero < Character
      include ::Rbrpg::Decorated

      def abilities
        @abilities ||= "rbrpg/skill_trees/#{self.class.name.demodulize.underscore}".classify.constantize.new
      end
    end
  end
end
