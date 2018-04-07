require_relative 'automated_init'

module ActivatedClass
  class Example
  end

  SubstAttr.activate Example

  class Example
    subst_attr :some_attr
  end
end


context "NullAddr is activated for a specific class" do
  test "The class is a NullAttr" do
    assert(ActivatedClass::Example.is_a? SubstAttr::Macro)
  end
end
