module ActivatedObjectClass
  NullAttr.activate
end

describe ActivatedObjectClass do
  context "NullAddr is not activated for a specific class" do
    specify "NullAttr is activated for the Object class" do
      expect(Object).to be_a NullAttr::Macro
    end
  end
end
