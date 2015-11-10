require_relative 'spec_init'

module Strict
  class SomeDependency
    def a_method; end
  end

  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr, SomeDependency
  end
end

describe "String" do
  example = Strict::Example.new

  context "Methods not on the impersonated class" do
    specify "The attribute's value doesn't respond" do
      assert_raises { example.some_attr.some_method }
    end
  end

  context "Methods on the impersonated class" do
    specify "The attribute's value responds" do
      example.some_attr.a_method
    end
  end
end
