module SubstituteType
  class SomeInterface
    def a_method; end
  end
end

describe "Null Object" do
  context "No interface provided to impersonate" do
    subject(:null_object) { SubstAttr::Substitute.build }

    specify "Weak null object" do
      expect(subject.class).to eq(SubstAttr::Substitute::NullObject::Weak)
    end
  end

  context "Interface provided to impersonate" do
    subject(:null_object) { SubstAttr::Substitute.build SubstituteType::SomeInterface }

    specify "Strict null object" do
      expect(subject.class.ancestors).to include(SubstituteType::SomeInterface)
    end
  end
end
