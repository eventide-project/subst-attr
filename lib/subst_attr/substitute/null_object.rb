module SubstAttr
  module Substitute
    module NullObject
      extend self

      def build(interface=nil)
        if interface
          return strict(interface)
        end

        weak
      end

      def weak
        Weak.new
      end

      def strict(interface)
        Naught.build do |config|
          config.singleton
          config.impersonate(interface)
        end.get
      end

      class Weak
        def method_missing(*)
        end
      end
    end
  end
end
