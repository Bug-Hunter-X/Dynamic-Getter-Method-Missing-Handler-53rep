```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?('get_')
      attribute = method_name.to_s[4..-1].to_sym
      if @value.respond_to?(:[]) && @value.key?(attribute)
        return @value[attribute]
      else
        raise "Attribute '#{attribute}' not found" # Raise a specific exception
      end
    else
      super
    end
  end
end

my_object = MyClass.new({name: "John", age: 30})
puts my_object.get_name # Output: John
begin
  puts my_object.get_city
rescue => e
  puts "Error: #{e.message}"
  # Log the error or handle it appropriately
end
```