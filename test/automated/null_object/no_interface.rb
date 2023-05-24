require_relative '../automated_init'

context "Null Object" do
  context "No interface provided to impersonate" do
    substitute = SubstAttr::Substitute.build

    detail "Substitute: #{substitute.inspect}"

    substitute.foo

    test "Creates weak null object" do
      assert(substitute.class == SubstAttr::Substitute::NullObject::MimicClass)
    end
  end
end
