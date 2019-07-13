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
        unless self.const_defined?(:Weak, false)
          cls = Mimic::Build.(Object) do
            def method_missing(*)
            end
          end

          const_set(:Weak, cls)
        end

        Weak.new
      end

      def strict(interface)
        Mimic.(interface)
      end
    end
  end
end