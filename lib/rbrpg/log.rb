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

    def say(text)
      self << text
    end

    def shout(text)
      self << text.capitalize.bold.red
    end

    def <<(val)
      changed
      notify_observers(val)
      super(val)
    end
  end
end
