require_relative 'spec_init'

module ActivatedClass
  class Example
  end

  SubstAttr.activate Example

  class Example
    subst_attr :some_attr
  end
end


describe "NullAddr is activated for a specific class" do
  specify "The class is a NullAttr" do
    assert(ActivatedClass::Example.is_a? SubstAttr::Macro)
  end
end
