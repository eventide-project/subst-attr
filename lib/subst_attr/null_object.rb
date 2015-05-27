module SubstAttr
  module NullObject
    extend self

    Weak = Naught.build do |config|
      config.define_explicit_conversions
      config.define_implicit_conversions
      config.predicates_return false
      config.singleton
    end

    def build(interface=nil)
      return weak unless interface
      return strict interface
    end

    def weak
      Weak.get
    end

    def strict(interface)
      specialization = specialization(interface)
      return specialization if specialization

      Naught.build do |config|
        config.singleton
        config.impersonate interface
      end.get
    end

    def specialization(interface)
      unless defined?(interface::NullObject) && interface::NullObject.respond_to?(:build)
        return nil
      end

      interface::NullObject.build
    end
  end
end
