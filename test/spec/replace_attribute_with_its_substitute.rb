require_relative 'spec_init'

module ReplaceWithSubstitute
  class SomeDependency
    def self.configure(receiver)
      receiver.some_attr = new
    end

    module Substitute
      def self.build
        :some_substutute
      end
    end
  end

  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr, SomeDependency

    def self.build
      new.tap do |instance|
        SomeDependency.configure instance
      end
    end
  end
end

describe "Replace an Attribute with its Substitute" do
  example = ReplaceWithSubstitute::Example.build
  SubstAttr::Substitute.(example, :some_attr)

  specify do
    assert(example.some_attr == :some_substutute)
  end
end
