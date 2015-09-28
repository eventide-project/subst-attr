module StrictWithSubstitute
  class SomeDependency
    module Substitute
      def self.build
        :some_substutute
      end
    end
  end

  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr, SomeDependency
  end
end

describe StrictWithSubstitute::Example do
  context "The impersonated class has an inner 'Substitute' constant with a 'build' method" do
    specify "Impersonated class provides specialized substitute" do
      expect(subject.some_attr).to eq(:some_substutute)
    end
  end
end
