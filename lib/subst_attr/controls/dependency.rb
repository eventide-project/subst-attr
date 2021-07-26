module SubstAttr
  module Controls
    module Dependency
      class Example
        def self.configure(receiver)
          receiver.specialized_substitute_attr = new
        end

        module Substitute
          def self.build
            :some_substitute
          end
        end

        class Descendant < Example
        end
      end

      module NoSubstitute
        class Example
        end
      end
    end
  end
end
