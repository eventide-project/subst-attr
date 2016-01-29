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

context "String" do
  example = Strict::Example.new

  context "Methods not on the impersonated class" do
    test "The attribute's value doesn't respond" do
      begin
        example.some_attr.some_method
      rescue => error
      end

      assert error
    end
  end

  context "Methods on the impersonated class" do
    test "The attribute's value responds" do
      example.some_attr.a_method
    end
  end
end
