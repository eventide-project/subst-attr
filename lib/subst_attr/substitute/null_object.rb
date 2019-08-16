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

      def strict(interface)
        Mimic.(interface, record: false)
      end

      def weak
        Weak.new
      end

      Weak = Mimic::Build.(Object, record: false) do
        def method_missing(*)
        end
      end
    end
  end
end
