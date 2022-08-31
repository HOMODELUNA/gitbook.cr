module Gitbook
  
  
  #Reduce the difference between a map and its default version
  def reduced_object(default_version : Hash(String,JSON::Type),current_version : Hash(String , JSON::Type)) # : Map
    return current_version if default_version.nil?
    return current_version.reduce( {} of String => JSON::Type ) do |prev,key,value|
      default_value = default_version[key]
      new_value = case value
      when Hash(String , JSON::Type)
        diffs = reduced_object(default_value,value)
        diffs.any? ? diffs : nil
      when default_value then nil
      else value
      end
      if value
        result = prev.dup
        result[key]=value
        result
      else
        prev
      end
    end
  end

end