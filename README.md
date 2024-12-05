# Unhandled Attribute Access in Dynamic Getter using method_missing

This repository demonstrates a potential bug in Ruby code that uses `method_missing` to create dynamic getter methods. The code dynamically retrieves attributes from a hash, but it doesn't handle the case where the requested attribute doesn't exist.  This can lead to unexpected `nil` returns or exceptions, depending on how the missing method is handled.

The `bug.rb` file contains the problematic code.  The `bugSolution.rb` file provides a corrected version with improved error handling. 