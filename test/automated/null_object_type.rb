require_relative 'automated_init'

module SubstituteType
  class SomeInterface
  end
end

context "Null Object" do
  context "No interface provided to impersonate" do
    substitute = SubstAttr::Substitute.build

    test "Weak null object" do
      assert(substitute.class == SubstAttr::Substitute::NullObject::Weak)
    end
  end

  context "Interface provided to impersonate" do
    null_object = SubstAttr::Substitute.build SubstituteType::SomeInterface

    test "Strict null object" do
      assert(null_object.class.ancestors.include? SubstituteType::SomeInterface)
    end
  end
end
