module StrictWithAncestorSubstitute
  class BaseDependency
    module Substitute
      def self.build
        :base_substutute
      end
    end
  end

  class SomeDependency < BaseDependency
  end

  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr, SomeDependency
  end
end

describe StrictWithAncestorSubstitute::Example do
  context "The impersonated class has an ancestor with an inner 'Substitute' constant with a 'build' method" do
    specify "Impersonated class provides specialized substitute" do
      expect(subject.some_attr).to eq(:base_substutute)
    end
  end
end
