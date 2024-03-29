require_relative '../automated_init'

context "Substitute" do
  context "Null Object" do
    example = Controls::Example.new

    substitute = example.null_object_substitute_attr

    detail "Null Object Substitute: #{substitute}"

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute_raises(NoMethodError) do
          substitute.some_method
        end
      end
    end

    context "Recording" do
      test "Not a recorder" do
        refute(substitute.is_a?(RecordInvocation))
      end
    end
  end
end
