require_relative 'spec_init'

module ActivatedObjectClass
  SubstAttr.activate
end

context "ActivatedObjectClass" do
  context "NullAddr is not activated for a specific class" do
    test "NullAttr is activated for the Object class" do
      assert(Object.is_a? SubstAttr::Macro)
    end
  end
end
