require_relative '../automated_init'

context "Null Object" do
  context "Interface Mimic" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented By the Interface" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.mimic_substitute_attr.some_method
        end
      end
    end

    context "Recording" do
      test "Is a recorder" do
        assert(example.mimic_substitute_attr.is_a? Mimic::Recorder)
      end
    end
  end
end
