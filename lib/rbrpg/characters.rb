module Rbrpg
  module Characters
    extend ::ActiveSupport::Autoload

    autoload :Character
    autoload :Hero
    autoload :Minion
  end
end
