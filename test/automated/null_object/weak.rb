require_relative '../automated_init'

context "Null Object" do
  context "Weak" do
    example = Controls::Example.new

    substitute = example.weak_substitute_attr

    detail "Weak Substitute: #{substitute}"

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute_raises(NoMethodError) do
          substitute.some_method
        end
      end
    end

    context "Recording" do
      test "Not a recorder" do
        refute(substitute.is_a? Mimic::Recorder)
      end
    end
  end
end
