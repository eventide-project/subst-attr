require_relative '../automated_init'

context "Null Object" do
  context "Strict" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented on the Impersonated Class" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.strict_substitute_attr.some_method
        end
      end
    end

    context "Recording" do
      test "Not a recorder" do
## change to be a recorder
        refute(example.strict_substitute_attr.is_a? Mimic::Recorder)
      end
    end
  end
end
