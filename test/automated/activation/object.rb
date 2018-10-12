require_relative '../automated_init'

context "Activation" do
  context "SubstAttr is activated by default for the Object class" do
    unchanged_object_class = Object.clone

    SubstAttr.activate

    test "Subst attr macro is defined on Object class" do
      assert(Object.is_a?(SubstAttr::Macro))
    end

    Object = unchanged_object_class

    refute(Object.is_a?(SubstAttr::Macro))
  end
end
