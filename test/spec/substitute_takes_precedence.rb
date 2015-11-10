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

describe "Both the substitute and null object namespaces are defined" do
  specify "The substitute takes precedence over null object specialization" do
    example = StrictWithSubstitute::Example.new
    assert(example.some_attr == :some_substutute)
  end
end
