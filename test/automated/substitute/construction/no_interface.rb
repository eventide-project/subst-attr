require_relative '../../automated_init'

context "Substitute" do
  context "Construction" do
    context "No Interface Specified" do
      substitute = SubstAttr::Substitute.build

      ancestry = substitute.class.ancestors

      comment "Substitute: #{substitute.inspect}"
      comment "Ancestors: #{ancestry.inspect}"

      test "Creates null object" do
        assert(substitute.class == SubstAttr::Substitute::NullObject)
      end
    end
  end
end
