require_relative 'automated_init'

module Weak
  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr
  end
end

context "Weak null object" do
  test "The attribute's value responds to any method" do
    example = Weak::Example.new
    example.some_attr.some_method
  end
end
