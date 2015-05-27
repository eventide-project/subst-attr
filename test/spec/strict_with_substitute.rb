module StrictWithSubstitute
  class SomeDependency
    def a_method; end

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

describe StrictWithSubstitute do
  context "The impersonated class has an inner 'Substitute' constant with a 'build' method" do
    specify "Impersonated class provides specialized null object" #do
    #   expect(subject.some_attr).to eq(:some_substutute)
    # end
  end
end
