module NullAttr
  def self.activate(target_class=nil)
    target_class ||= Object

    return if target_class.ancestors.include? NullAttr::Macro

    target_class.extend NullAttr::Macro
  end
end
