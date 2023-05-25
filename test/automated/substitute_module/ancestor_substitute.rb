require_relative '../automated_init'

context "Substitute" do
  context "From Ancestor" do
    example = Controls::Example::Ancestry::Example.new

    test "Subclass dependency inherits superclass substitute" do
      assert(example.some_dependency_attr == :some_substitute)
    end
  end
end
