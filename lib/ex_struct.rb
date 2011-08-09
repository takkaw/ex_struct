require 'ostruct'
class ExStruct < OpenStruct
  def method_missing(mid, *args)
    mname = mid.id2name
    len = args.length
    if mname.chomp!('=')
      if len != 1
        raise ArgumentError, "wrong number of arguments (#{len} for 1)", caller(1)
      end
      modifiable[new_ostruct_member(mname)] = args[0]
    elsif mname.chomp!('?')
      if len != 0
        raise ArgumentError, "wrong number of arguments (#{len} for 0)", caller(1)
      end
      @table[mname.to_sym]
    elsif len == 0
      ret = @table[mid]
      ret = (modifiable[new_ostruct_member(mname)] = self.class.new) unless ret
      ret
    else  
      raise ArgumentError, "wrong number of arguments (#{len} for 0)", caller(1)
    end   
  end
end

