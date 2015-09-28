module StrictSpecializedNullObject
  class SomeDependency
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

describe StrictSpecializedNullObject::Example do
  context "The impersonated class has an inner 'NullObject' constant with a 'build' method" do
    specify "Impersonated class provides specialized null object" do
      expect(subject.some_attr).to eq(:some_null_object)
    end
  end
end
