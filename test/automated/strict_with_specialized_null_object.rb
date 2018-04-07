require_relative 'automated_init'

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

context "The impersonated class has an inner 'NullObject' constant with a 'build' method" do
  test "Impersonated class provides specialized null object" do
    example = StrictSpecializedNullObject::Example.new
    assert(example.some_attr == :some_null_object)
  end
end
