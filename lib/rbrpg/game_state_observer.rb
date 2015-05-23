module Rbrpg
  class GameStateObserver
    def initialize
      ::Rbrpg::Log.instance.add_observer(self, :new_log_line)

      ::Rbrpg::Game.current.player.hero.add_observer(self, :character_changed)
      ::Rbrpg::Game.current.computer.hero.add_observer(self, :character_changed)
    end

    def character_changed(character, event_type, event_description)
      ::Rbrpg::Log.instance.send("character_#{event_type}", event_description)
    end

    def new_log_line(line)
      ::Rbrpg::Game.current.display.clear
      ::Rbrpg::Game.current.display.draw

      ::Rbrpg::Game.current.log.take(10).map{|line| puts line }
    end
  end
end
