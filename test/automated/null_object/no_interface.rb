require_relative '../automated_init'

context "Null Object" do
  context "No interface provided to impersonate" do
    substitute = SubstAttr::Substitute.build

    test "Creates weak null object" do
      assert(substitute.class == SubstAttr::Substitute::NullObject::Weak)
    end
  end
end
