module SubstAttr
  module Substitute
    module NullObject
      extend self

      def build
        Implementation.new
      end

      Implementation = Mimic::Build.(Object, record: false) do
        def method_missing(*)
        end
      end
    end
  end
end
