require_relative '../automated_init'

context "Activate" do
  context "SubstAttr is activated for a specific class" do
    some_class = Class.new

    SubstAttr.activate(some_class)

    test "The class is a SubstAttr" do
      assert(some_class.is_a?(SubstAttr::Macro))
    end
  end
end
