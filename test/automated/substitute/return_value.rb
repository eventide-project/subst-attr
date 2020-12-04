require_relative '../automated_init'

context "Substitute" do
  context "Return Value" do
    example = Controls::Example.build
    assert(example.some_attr.is_a?(Controls::Dependency::Example))

    some_substitute = SubstAttr::Substitute.(:some_attr, example)

    test "Return value is the substitute" do
      assert(some_substitute == :some_substutute)
    end
  end
end
