module StrictSpecialized
  class SomeDependency
    def a_method; end

    module NullObject
      def self.build
        :some_null_object
      end
    end
  end

  class Example
    extend NullAttr::Macro

    null_attr :some_attr, SomeDependency
  end
end

describe StrictSpecialized::Example do
  context "The impersonated class has an inner 'NullObject' module with a 'build' method" do
    specify "Impersonated class provides specialized null object" do
      expect(subject.some_attr).to eq(:some_null_object)
    end
  end
end
