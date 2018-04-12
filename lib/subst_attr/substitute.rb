module SubstAttr
  module Substitute
    extend self

    def build(interface=nil)
      if interface
        specialization = specialization(interface)
        return specialization if specialization
      end

      return NullObject.build(interface)
    end

    def call(attr_name, receiver)
      interface = receiver.send(attr_name).class
      substitute = build(interface)
      receiver.send :"#{attr_name}=", substitute
    end

    def specialization(interface)
      constant_name = :Substitute

      reflection = Reflect.(interface, constant_name, strict: false, ancestors: true)

      if reflection.nil?
        return nil
      end

      specialization_module = reflection.constant

      unless specialization_module.respond_to?(:build)
        return nil
      end

      specialization_module.send(:build)
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
