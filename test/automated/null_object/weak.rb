require_relative '../automated_init'

context "Null Object" do
  context "Weak" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute_raises(NoMethodError) do
          example.weak_substitute_attr.some_method
        end
      end
    end

    context "Recording" do
      test "Not a recorder" do
        refute(example.weak_substitute_attr.is_a? Mimic::Recorder)
      end
    end
  end
end
