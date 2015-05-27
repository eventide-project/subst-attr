module ActivatedClass
  class Example
  end

  NullAttr.activate Example

  class Example
    null_attr :some_attr
  end
end

describe ActivatedClass::Example do
  context "NullAddr is activated for a specific class" do
    specify "The class is a NullAttr" do
      expect(ActivatedClass::Example).to be_a NullAttr::Macro
    end
  end
end
