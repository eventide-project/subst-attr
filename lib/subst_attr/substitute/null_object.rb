module SubstAttr
  module Substitute
    module NullObject
      extend self

      Weak = Naught.build do |config|
        config.define_explicit_conversions
        config.define_implicit_conversions
        config.predicates_return false
        config.singleton
      end

      def build(interface=nil)
        if interface
          return strict(interface)
        end

        weak
      end

      def weak
        Weak.get
      end

      def strict(interface)
        Naught.build do |config|
          config.singleton
          config.impersonate(interface)
        end.get
      end
    end
  end
end
