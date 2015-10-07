module SubstAttr
  module Attribute
    def self.define(target_class, attr_name, interface=nil)
      ::Attribute::Define.(target_class, attr_name, :accessor) do
        Substitute.build interface
      end
    end
  end
end
