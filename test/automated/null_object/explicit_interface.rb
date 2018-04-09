require_relative '../automated_init'

context "Null Object" do
  context "Interface provided to impersonate" do
    interface = Class.new
    null_object = SubstAttr::Substitute.build(interface)

    test "Creates strict null object" do
      assert(null_object.class.ancestors.include?(interface))
    end
  end
end
