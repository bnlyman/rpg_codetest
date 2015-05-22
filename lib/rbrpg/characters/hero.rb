module Rbrpg
  module Characters
    class Hero < Character
      include ::Rbrpg::Decorated

      def initialize
        super
      end
    end
  end
end
