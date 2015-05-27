module SubstituteTakesPrecedence
  class SomeDependency
    def a_method; end

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

describe StrictWithSubstitute::Example do
  context "Both the substitute and null object namespaces are defined" do
    specify "The substitute takes precedence over null object specialization" do
      expect(subject.some_attr).to eq(:some_substutute)
    end
  end
end
