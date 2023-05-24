module SubstAttr
  module Substitute
    module NullObject
      extend self

      def build
        MimicClass.new
      end

      MimicClass = Mimic::Build.(Object, record: false) do
        def method_missing(*)
        end
      end
    end
  end
end
