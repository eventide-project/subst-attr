module NullObjectType
  class SomeInterface
    def a_method; end
  end
end

describe SubstAttr::NullObject do
  context "No interface provided to impersonate" do
    subject(:null_object) { SubstAttr::NullObject.build }

    specify "Weak null object" do
      expect(subject.class).to eq(SubstAttr::NullObject::Weak)
    end
  end

  context "Interface provided to impersonate" do
    subject(:null_object) { SubstAttr::NullObject.build NullObjectType::SomeInterface }

    specify "Strict null object" do
      expect(subject.class.ancestors).to include(NullObjectType::SomeInterface)
    end
  end
end
