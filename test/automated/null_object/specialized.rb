require_relative '../automated_init'

context "Null Object" do
  context "Specialized" do
    example = Controls::Example.new

    test "Attribute value is the substitute" do
      assert(example.specialized_substitute_attr == :some_substitute)
    end
  end
end
