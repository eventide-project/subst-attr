module SubstAttr
  module Macro
    def subst_attr_macro(attr_name, interface=nil)
      SubstAttr::Attribute.define(self, attr_name, interface)
    end
    alias :subst_attr :subst_attr_macro
  end
end
