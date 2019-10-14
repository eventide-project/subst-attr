require_relative '../automated_init'

context "Null Object" do
  context "Weak" do
    example = Controls::Example.build

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute_raises NoMethodError do
          example.weak_attr.some_method
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
