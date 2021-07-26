require_relative '../automated_init'

context "Substitute" do
  context "Replace an Attribute with its Substitute" do
    example = Controls::Example.build
    assert(example.specialized_substitute_attr.is_a?(Controls::Dependency::Example))

    SubstAttr::Substitute.(:specialized_substitute_attr, example)

    test "Attribute is replaced with its substitute" do
      assert(example.specialized_substitute_attr == :some_substitute)
    end
  end
end
