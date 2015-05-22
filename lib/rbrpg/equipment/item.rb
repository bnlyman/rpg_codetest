module Rbrpg
  module Equipment
    class Item
      def self.inherited(subklass)
        super(subklass)

        subklass.__send__("attr_reader", *subklass.default_properties.keys) if subklass.respond_to?(:default_properties)
      end
    end
  end
end
