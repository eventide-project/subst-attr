require_relative '../automated_init'

context "Null Object" do
  context "Strict" do
    example = Controls::Example.build

    context "Invoking Methods Not Implemented on the Impersonated Class" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.some_attr.some_method
        end
      end
    end

    context "Recording" do
      test "Not a recorder" do
        refute(example.is_a? Mimic::Recorder)
      end
    end
  end
end
