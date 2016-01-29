require_relative 'spec_init'

module SubstituteTakesPrecedence
  class SomeDependency
    module Substitute
      def self.build
        :some_substutute
      end
    end

    module NullObject
      def self.build
        :some_null_object
      end
    end
  end

  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr, SomeDependency
  end
end

context "Both the substitute and null object namespaces are defined" do
  test "The substitute takes precedence over null object specialization" do
    example = SubstituteTakesPrecedence::Example.new
    assert(example.some_attr == :some_substutute)
  end
end
