module Rbrpg
  module Items
    class Item
      def self.inherited(subklass)
        super(subklass)
        subklass.__send__("attr_reader", *subklass.default_properties.keys)
      end
    end
  end
end
