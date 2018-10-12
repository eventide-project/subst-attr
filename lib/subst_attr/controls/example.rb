module SubstAttr
  module Controls
    class Example
      include SubstAttr

      subst_attr :some_attr, Dependency::Example

      subst_attr :weak_attr

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end

      module Ancestry
        class Example
          SubstAttr.activate(self)

          subst_attr :some_attr, Dependency::Example::Descendant
        end
      end
    end
  end
end
