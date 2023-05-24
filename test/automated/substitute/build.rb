require_relative '../automated_init'

context "Substitute" do
  context "Build Method" do
    example = Controls::Example.build
    assert(example.specialized_substitute_attr.is_a?(Controls::Dependency::Example))

    some_substitute = SubstAttr::Substitute.(:specialized_substitute_attr, example)

    test "Return value is the substitute" do
      assert(some_substitute == :some_substitute)
    end
  end
end
