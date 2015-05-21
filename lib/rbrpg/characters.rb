module Rbrpg
  module Characters
    extend ::ActiveSupport::Autoload

    autoload :Character
    autoload :ComputerHero
    autoload :Hero
    autoload :Minion
    autoload :Necromancer
    autoload :PlayerHero
    autoload :Warrior
  end
end
