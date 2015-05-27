module SubstAttr
  module Substitute
    extend self

    def build(interface=nil)
      if interface
        specialization = specialization(interface)
        return specialization if specialization
      end

      return NullObject.build interface
    end

    def specialization(interface)
      const_name = :Substitute

      unless interface.const_defined?(const_name)
        return nil
      end

      mod = interface.const_get(const_name)

      unless mod.respond_to?(:build)
        return nil
      end

      mod.send :build
    end

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
          specialization = specialization(interface)
          return specialization if specialization
        end

        return weak unless interface
        return strict interface
      end

      def weak
        Weak.get
      end

      def strict(interface)
        Naught.build do |config|
          config.singleton
          config.impersonate interface
        end.get
      end

      def specialization(interface)
        const_name = :NullObject

        unless interface.const_defined?(const_name)
          return nil
        end

        mod = interface.const_get(const_name)

        unless mod.respond_to?(:build)
          return nil
        end

        mod.send :build
      end
    end
  end
end
