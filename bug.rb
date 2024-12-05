```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?('get_')
      attribute = method_name.to_s[4..-1].to_sym
      return @value[attribute] if @value.respond_to?(:[]) && @value.key?(attribute)
      # Handle cases where the attribute doesn't exist
      return nil # Or raise an exception
    else
      super # Pass the method call to the superclass
    end
  end
end

my_object = MyClass.new({name: "John", age: 30})
puts my_object.get_name # Output: John
puts my_object.get_city # Output: nil (or raises an exception if not handled)
```