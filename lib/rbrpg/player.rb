module Rbrpg
  class Player
    attr_accessor :hero, :name

    def initialize(hero_type:, name:)
      @hero = 'rbrpg/characters/#{hero_type}'.constantize.classify.new
      @name = name
    end
  end
end
