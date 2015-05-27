module NullObjectType
  class SomeInterface
    def a_method; end
  end
end

describe NullAttr::NullObject do
  context "No interface provided to impersonate" do
    subject(:null_object) { NullAttr::NullObject.build }

    specify "Weak null object" do
      expect(subject.class).to eq(NullAttr::NullObject::Weak)
    end
  end

  context "Interface provided to impersonate" do
    subject(:null_object) { NullAttr::NullObject.build NullObjectType::SomeInterface }

    specify "Strict null object" do
      expect(subject.class.ancestors).to include(NullObjectType::SomeInterface)
    end
  end
end
