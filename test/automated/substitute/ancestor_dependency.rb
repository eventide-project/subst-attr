require_relative '../automated_init'

context "Substitute" do
  context "From Ancestor Dependency" do
    example = Controls::Example::Ancestry::Example.new

    test do
      assert(example.some_attr == :some_substutute)
    end
  end
end
