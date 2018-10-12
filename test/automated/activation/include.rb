require_relative '../automated_init'

context "Activation" do
  context "Include" do
    cls = Controls::Included::Example

    test "The class includes the subst attr macro" do
      assert(cls.respond_to?(:subst_attr))
    end
  end
end
