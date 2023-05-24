require_relative '../automated_init'

context "Substitute" do
  context "Mixin" do
    example_class = Controls::Dependency::MixinSubstitute::Example

    test "Dependency class provides substitute namespace" do
      assert(example_class.const_defined?(:Substitute, false))
    end

    test "Substitute namespace does not implement build method" do
      refute(example_class::Substitute.respond_to?(:build))
    end
  end
end
