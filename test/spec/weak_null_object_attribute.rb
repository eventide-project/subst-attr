module Weak
  class Example
    extend NullAttr::Macro

    null_attr :some_attr
  end
end

describe Weak::Example do
  context "Weak null object" do
    specify "The attribute's value responds to any method" do
      expect { subject.some_attr.some_method }.not_to raise_error
    end
  end
end
