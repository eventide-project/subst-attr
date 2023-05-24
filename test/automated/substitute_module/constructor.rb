require_relative '../automated_init'

context "Substitute" do
  context "Constructor" do
    example_class = Controls::Dependency::Example

    test "Dependency class provides substitute namespace" do
      assert(example_class.const_defined?(:Substitute, false))
    end

    test "Substitute namespace implements build method" do
      assert(example_class::Substitute.respond_to?(:build))
    end
  end
end
