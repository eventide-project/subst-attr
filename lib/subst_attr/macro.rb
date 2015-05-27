module NullAttr
  module Macro
    def null_attr_macro(attr_name, interface=nil)
      NullAttr::Attribute.define(self, attr_name, interface)
    end
    alias :null_attr :null_attr_macro
  end
end
