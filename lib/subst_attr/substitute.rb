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
      substitute
    end

    def specialization(interface)
      constant_name = :Substitute

      reflection = Reflect.(interface, constant_name, strict: false, ancestors: true)

      if reflection.nil?
        return nil
      end

      specialization_module = reflection.constant

      if specialization_module.equal?(self)
        return nil
      end

      unless specialization_module.respond_to?(:build)
        return nil
      end

      specialization_module.send(:build)
    end
  end
end
