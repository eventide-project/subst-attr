require_relative '../automated_init'

context "Substitute" do
  context "Interface Mimic" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented By the Interface" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.mimic_substitute_attr.some_missing_method
        end
      end
    end

    context "Recording" do
      test "Mimic is a recorder" do
        assert(example.mimic_substitute_attr.is_a?(RecordInvocation))
      end

      context "Invocations" do
        substitute = example.mimic_substitute_attr

        substitute.some_method

        recorded = substitute.invoked?(:some_method)

        test "Are recorded" do
          assert(recorded)
        end
      end
    end
  end
end
