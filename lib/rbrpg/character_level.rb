module Rbrpg
  class CharacterLevel
    EXPERIENCE_TO_REACH_LEVEL = {
      1 => 100,
      2 => 200,
      3 => 400,
      4 => 800,
      5 => 1600,
      6 => 3200,
      7 => 6400,
      8 => 12_800,
      9 => 25_600,
      10 => 51_200
    }

    EXPERIENCE_LEVEL_RANGES = EXPERIENCE_TO_REACH_LEVEL.inject({}) do |result, (k, v)|
      experience_range = (EXPERIENCE_TO_REACH_LEVEL[k]..EXPERIENCE_TO_REACH_LEVEL[k+1]) if EXPERIENCE_TO_REACH_LEVEL.key?(k+1)
      result[experience_range] = v
      result
    end

    EXPERIENCE_AT_LEVEL = EXPERIENCE_TO_REACH_LEVEL.invert

    def initialize(number)
      @number = number
      @required_experience_points = EXPERIENCE_TO_REACH_LEVEL[number]
    end

    def self.level_range
      (1..10).map{ new(number) }
    end

    def self.[](experience)
      EXPERIENCE_AT_LEVEL.select{|k,v|
        k === experience
      }
    end

    def ==(other)
      EXPERIENCE_AT_LEVEL[level_number].include?
    end
  end
end
