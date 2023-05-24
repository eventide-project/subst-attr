module SubstAttr
  module Attribute
## record
    def self.define(target_class, attr_name, interface=nil)
      ::Attribute::Define.(target_class, attr_name, :accessor) do
## record
        Substitute.build(interface)
      end
    end
  end
end
