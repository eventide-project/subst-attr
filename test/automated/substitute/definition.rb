require_relative '../automated_init'

context "Substitute" do
  context "Definition" do
    example_class = SubstAttr::Controls::Dependency::Example

    test "Dependency class provides substitute namespace" do
      assert(example_class.const_defined?(:Substitute, false))
    end

    test "Substitute namespace implemented build method" do
      assert(SubstAttr::Controls::Dependency::Example::Substitute.respond_to?(:build))
    end
  end
end
