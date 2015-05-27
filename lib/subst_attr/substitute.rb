module SubstAttr
  module Substitute
    def self.build(interface=nil)
      specialization = specialization(interface)
      return specialization if specialization


      return NullObject.weak unless interface
      return NullObject.strict interface
    end

    def self.specialization(interface)
      unless defined?(interface::NullObject) && interface::NullObject.respond_to?(:build)
        return nil
      end

      interface::NullObject.build
    end

    module NullObject
      extend self

      Weak = Naught.build do |config|
        config.define_explicit_conversions
        config.define_implicit_conversions
        config.predicates_return false
        config.singleton
      end

      # def build(interface=nil)
      #   return weak unless interface
      #   return strict interface
      # end

      def weak
        Weak.get
      end

      def strict(interface)
        Naught.build do |config|
          config.singleton
          config.impersonate interface
        end.get
      end
    end
  end
end
