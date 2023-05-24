require_relative '../automated_init'

context "Substitute" do
  context "Replace an Operational Attribute with its Substitute" do
    example = Controls::Example.build

    operational_dependency = example.specialized_substitute_attr

    assert(operational_dependency.is_a?(Controls::Dependency::Example))

    comment "Operational Dependency: #{operational_dependency.inspect}"

    SubstAttr::Substitute.(:specialized_substitute_attr, example)

    comment "Replaced Dependency: #{example.specialized_substitute_attr.inspect}"

    test "Attribute is replaced with its substitute" do
      assert(example.specialized_substitute_attr == :some_substitute)
    end
  end
end
