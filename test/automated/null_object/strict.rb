require_relative '../automated_init'

context "Null Object" do
  context "Strict" do
    example = Controls::Example.new

    context "Attribute Has A Specialized Substitute" do
      test "Attribute value is the substitute" do
        assert(example.some_attr == :some_substitute)
      end
    end

    context "Attribute Lacks A Specialized Substitute" do
      context "Invoking Methods Not Implemented on the Impersonated Class" do
        test "Is an error" do
          assert_raises(NoMethodError) do
            example.no_substitute_attr.some_method
          end
        end
      end

      context "Recording" do
        test "Not a recorder" do
          refute(example.no_substitute_attr.is_a? Mimic::Recorder)
        end
      end
    end
  end
end
