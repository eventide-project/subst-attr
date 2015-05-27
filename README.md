# subst_attr

Attributes that have default implementations that are substitutes or null objects

## Examples

### A Weak Attribute

Has a default value of a null object that responds to any method (a _weak_ null object)

```ruby
class Example
  subst_attr :some_attr
end

e = Example.new
e.anything # => No error raised
```

### A Strict Attribute

Has a default value of a null object that responds only to the methods of the specified class

```ruby
class SomeDependency
  def some_method
    # ...
  end
end

class Example
  subst_attr :some_attr, SomeDependency
end

e = Example.new
e.some_method # => No error raised
e.anything # => NoMethodError is raised
```

### A Strict Attribute that Provides a Specialized Substitute

If the class used to define the attribute's strict interface has an inner `NullObject` namespace that has a `build` method, the object that will be used as the null object is the one returned from the `build` method.

_NOTE: Use this if a custom substitute implementation is needed, including a specialized null object_

```ruby
class SomeDependency
  def some_method
    # ...
  end

  module Substitute
    def self.build
      SomeOtherThing.etc
    end
  end
end

class Example
  subst_attr :some_attr, SomeDependency
end

e = Example.new
```

### [Deprecated] A Strict Attribute that Provides a Specialized Null Object

[Deprecated: Use the Substitute feature instead]

If the class used to define the attribute's strict interface has an inner `NullObject` namespace that has a `build` method, the object that will be used as the null object is the one returned from the `build` method.

```ruby
class SomeDependency
  def some_method
    # ...
  end

  module NullObject
    def self.build
      SomeOtherNullObjectLibrary.etc
    end
  end
end

class Example
  subst_attr :some_attr, SomeDependency
end

e = Example.new
```

## Activation

Typically, the SubstAddr module must be included in a class that will use the `subst_attr` macro.

The `SubstAddr` can be included in Ruby's `Object` archetype, making the `subst_attr` macro available to all classes.

The `activate` method is provided as a shortcut to opening the `Object` class and including the `SubstAttr` explicitly.

```Ruby
SubstAttr.activate

class Example
  subst_attr :some_attr
end
```

Alternatively, the `SubstAddr` module can be included anywhere within the object hierarchy by specifying the class to activate.

```Ruby
class Example
end

SubstAttr.activate Example

class Example
  subst_attr :some_attr
end
```

As in the example above, for a class to be "activated" for `SubstAddr`, the class must have already been defined. The `subst_addr` class method must be visible to the class using it, either my including it in the class directly, or by including it in any super class of the using class.
