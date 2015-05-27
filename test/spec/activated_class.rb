module ActivatedClass
  class Example
  end

  SubstAttr.activate Example

  class Example
    subst_attr :some_attr
  end
end

describe ActivatedClass::Example do
  context "NullAddr is activated for a specific class" do
    specify "The class is a NullAttr" do
      expect(ActivatedClass::Example).to be_a SubstAttr::Macro
    end
  end
end
