require 'active_support/all'
require 'highline'
require "highline/import"
require 'observer'
require "rbrpg/version"

module Rbrpg
  extend ::ActiveSupport::Autoload

  autoload :Actions
  autoload :CharacterAbilities
  autoload :Characters
  autoload :Decorate
  autoload :Equipment
  autoload :Game
  autoload :Log
  autoload :Computer
  autoload :Player
  autoload :Renderer
  autoload :Turn
end
