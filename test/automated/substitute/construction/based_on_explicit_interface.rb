require_relative '../../automated_init'

context "Substitute" do
  context "Construction" do
    context "Based On an Explicit Interface" do
      mimicked_interface = Class.new
      substitute = SubstAttr::Substitute.build(mimicked_interface)

      ancestry = substitute.class.ancestors

      comment "Substitute: #{substitute.inspect}"
      comment "Ancestors: #{ancestry.inspect}"

      test "Is a mimic of the interface" do
        assert(ancestry.include?(mimicked_interface))
      end
    end
  end
end
