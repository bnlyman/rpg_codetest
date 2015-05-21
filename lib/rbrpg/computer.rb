module Rbrpg
  class Computer
    attr_accessor :hero, :name

    def initialize(hero_type:, name:)
      @hero_type = hero_type
      @hero = hero_class.new
      @name = name
    end

    def valid_targets
      [ @hero ]
    end

    def valid_target_hash
      valid_targets.each_with_object({}) do |result,obj|
        result[obj.class.name.demodulize.underscore.to_sym] = obj
      end
    end

    private

    def hero_class
      @hero_class ||= "rbrpg/characters/#{@hero_type}".classify.constantize
    end
  end
end
