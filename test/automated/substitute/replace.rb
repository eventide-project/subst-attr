require_relative '../automated_init'

context "Substitute" do
  context "Replace an Attribute with its Substitute" do
    example = Controls::Example.build
    assert(example.some_attr.is_a?(Controls::Dependency::Example))

    SubstAttr::Substitute.(:some_attr, example)

    test "Attribute is replaced with its substitute" do
      assert(example.some_attr == :some_substutute)
    end
  end
end
