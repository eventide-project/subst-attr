module SubstAttr
  module Controls
    class Example
      include SubstAttr

      subst_attr :specialized_substitute_attr, Dependency::Example

      subst_attr :strict_substitute_attr, Dependency::NoSubstitute::Example

      subst_attr :weak_substitute_attr

      subst_attr :mixed_in_substitute_attr, Dependency::MixinSubstitute::Example

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end

      module Ancestry
        class Example
          include SubstAttr

          subst_attr :some_attr, Dependency::Example::Descendant
        end
      end
    end
  end
end
