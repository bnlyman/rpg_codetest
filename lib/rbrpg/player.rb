module Rbrpg
  class Player
    attr_accessor :hero, :name

    def initialize(hero_type:, name:)
      @hero_type = hero_type
      @hero = hero_class.new
      @name = name
    end

    private

    def hero_class
      @hero_class ||= "rbrpg/characters/#{@hero_type}".classify.constantize
    end
  end
end
