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
  autoload :CharacterLevel
  autoload :Decorated
  autoload :Equipment
  autoload :Game
  autoload :Log
  autoload :Computer
  autoload :Player
  autoload :Renderer
  autoload :SkillTrees
  autoload :Turn
end
