require_relative '../automated_init'

context "Null Object" do
  context "Mixin" do
    example = Controls::Example.new

    substitute = example.mixed_in_substitute_attr

    detail "Substitute: #{substitute.inspect}"
    detail "Substitute Ancestors: #{substitute.class.ancestors.inspect}"

    substitute_module_mixed_in = substitute.is_a?(Controls::Dependency::MixinSubstitute::Example::Substitute)

    test "Substitute mixed in" do
      assert(substitute_module_mixed_in)
    end
  end
end
