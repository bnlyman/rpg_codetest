require 'matrix'
require 'colored'

module Rbrpg
  class Log < SimpleDelegator
    include ::Observable

    def self.instance
      @instance ||= new
    end

    def initialize
      @lines ||= []
    end

    def __getobj__
      @lines
    end

    def character_cast(text)
      self << LogLine.new(text, :event_type => :character_cast)
    end

    def character_hit(text)
      self << LogLine.new(text, :event_type => :character_hit)
    end

    def character_healed(text)
      self << LogLine.new(text, :event_type => :character_healed)
    end

    def phase_changed(text)
      self << LogLine.new(text, :event_type => :phase_changed)
    end

    def say(text)
      self << LogLine.new(text, :event_type => :say)
    end

    def shout(text)
      self << LogLine.new(text.capitalize.bold, :event_type => :shout)
    end

    def turn_changed(text)
      self << LogLine.new(text, :event_type => :turn_changed)
    end

    def <<(val)
      self.unshift(val)
      changed(true)
      notify_observers(val)
    end
  end

  class LogLine < SimpleDelegator
    def initialize(text, event_type:)
      text = text.join(" ") if text.is_a?(Array)
      event_color = {
        :character_hit => :red,
        :character_healed => :green,
        :turn_changed => :blue,
        :decision => :pink,
        :say => :white,
        :shout => :red,
        :phase_changed => :yellow
      }.fetch(event_type) { :white }

      @line = text.send(event_color)
    end

    def __getobj__
      @line
    end
  end
end
