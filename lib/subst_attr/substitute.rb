module SubstAttr
  module Substitute
    extend self

    def build(interface=nil, record: nil)
      if record.nil?
        record = true
      end

      if interface.nil?
        return NullObject.build
      end

      substitute_module = substitute_module(interface)

      if substitute_module.nil?
        return mimic(interface, record)
      end

      if substitute_module.respond_to?(:build)
        return substitute_module.send(:build)
      end

      mimic = mimic(interface, record)
      mimic.extend(substitute_module)

      mimic
    end

    def null_object
      NullObject.build
    end

    def mimic(interface, record)
      Mimic.(interface, record: record)
    end

    def call(attr_name, receiver)
      interface = receiver.send(attr_name).class
      substitute = build(interface)
      receiver.send :"#{attr_name}=", substitute
      substitute
    end

    def substitute_module(interface)
      constant_name = :Substitute

      reflection = Reflect.(interface, constant_name, strict: false, ancestors: true)

      if reflection.nil?
        return nil
      end

      mod = reflection.constant

      if mod.equal?(self)
        return nil
      end

      mod
    end
  end
end
