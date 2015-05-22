module Rbrpg
  module Decorate
    def display_name
      try(:name){|str| str.demodulize.humanize } || try(:class).try(:name){|str| str.demodulize.humanize }
    end
    module_function :display_name
  end
end
