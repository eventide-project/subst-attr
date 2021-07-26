require_relative '../automated_init'

context "Null Object" do
  context "Attribute's Substitute Module Isn't A Specialization" do
    cls = Class.new do
      include SubstAttr

      def some_method
      end
    end
    assert(cls::Substitute == SubstAttr::Substitute)

    substitute = SubstAttr::Substitute.build(cls)

    compare_methods = substitute.methods - Mimic.preserved_methods
    compare_methods.sort!

    control_methods = Mimic.subject_methods(cls).map { |method| method.name }
    control_methods.sort!

    comment "Substitute Methods: #{compare_methods.inspect}"
    detail "Control Methods: #{control_methods.inspect}"

    is_strict_null_object = compare_methods == control_methods

    test "Strict null object" do
      assert(is_strict_null_object)
    end
  end
end
