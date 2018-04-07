require_relative 'automated_init'

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

context "The impersonated class has an ancestor with an inner 'Substitute' constant with a 'build' method" do
  test "Impersonated class provides specialized substitute" do
    example = StrictWithAncestorSubstitute::Example.new
    assert(example.some_attr == :base_substutute)
  end
end
