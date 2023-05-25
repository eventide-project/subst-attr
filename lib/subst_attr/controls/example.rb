module SubstAttr
  module Controls
    class Example
      include SubstAttr

      subst_attr :constructed_substitute_attr, Dependency::Example

      subst_attr :mimic_substitute_attr, Dependency::NoSubstituteModule::Example
      subst_attr :no_recorder_mimic_substitute_attr, Dependency::NoSubstituteModule::Example

      subst_attr :null_object_substitute_attr

      subst_attr :mixed_in_substitute_attr, Dependency::MixinSubstitute::Example

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end

      module Ancestry
        class Example
          include SubstAttr

          subst_attr :some_dependency_attr, Dependency::Example::Descendant
        end
      end
    end
  end
end
