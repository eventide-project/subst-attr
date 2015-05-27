module Strict
  class SomeDependency
    def a_method; end
  end

  class Example
    extend NullAttr::Macro

    null_attr :some_attr, SomeDependency
  end
end

describe Strict::Example do
  context "Methods not on the impersonated class" do
    specify "The attribute's value doesn't respond" do
      expect { subject.some_attr.some_method }.to raise_error
    end
  end

  context "Methods on the impersonated class" do
    specify "The attribute's value responds" do
      expect { subject.some_attr.a_method }.to_not raise_error
    end
  end
end
