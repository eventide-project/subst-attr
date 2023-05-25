require_relative '../../automated_init'

context "Substitute" do
  context "Construction" do
    context "SubstAttr::Substitute Inner Namespace Special Case" do
      context "No Substitute Module" do
        cls = Class.new do
          include SubstAttr

          def some_method
          end
        end

        test "SubstAttr::Substitute is the inner Substitute namespace due to the effects of Ruby's constant lookup" do
          assert(cls::Substitute == SubstAttr::Substitute)
        end
      end
    end
  end
end
