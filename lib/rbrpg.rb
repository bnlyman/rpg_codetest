require 'active_support/all'
require "rbrpg/version"
# require "rbrpg/game"
# require "rbrpg/player"
# require "rbrpg/display"
# require "rbrpg/characters"

module Rbrpg
  extend ::ActiveSupport::Autoload

  autoload :Characters
  autoload :Equipment
  autoload :Game
  autoload :Computer
  autoload :Player
  autoload :Renderer
  autoload :Turn
end
