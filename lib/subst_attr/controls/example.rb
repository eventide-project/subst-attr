module SubstAttr
  module Controls
    class Example
      extend SubstAttr::Macro

      subst_attr :some_attr, Dependency::Example

      subst_attr :weak_attr

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end

      module Ancestry
        class Example
          extend SubstAttr::Macro

          subst_attr :some_attr, Dependency::Example::Descendant
        end
      end
    end
  end
end
