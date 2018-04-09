require_relative '../automated_init'

context "Activate" do
  context "SubstAttr is activated by default for the Object class" do
    unchanged_object_class = Object.clone

    SubstAttr.activate

    test "Object is a SubstAttr" do
      assert(Object.is_a?(SubstAttr::Macro))
    end

    Object = unchanged_object_class

    refute(Object.is_a?(SubstAttr::Macro))
  end
end
