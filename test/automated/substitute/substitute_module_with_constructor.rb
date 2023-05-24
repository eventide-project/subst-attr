require_relative '../automated_init'

context "Substitute" do
  context "Module with Constructor" do
    example = Controls::Example.new

    test "Dependency attribute value is the return value of the constructor" do
      assert(example.specialized_substitute_attr == :some_substitute)
    end
  end
end
