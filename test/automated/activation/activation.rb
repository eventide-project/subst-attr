require_relative '../automated_init'

context "Activation" do
  some_class = Class.new

  SubstAttr.activate(some_class)

  test "The class includes the subst attr macro" do
    assert(some_class.is_a?(SubstAttr::Macro))
  end
end
