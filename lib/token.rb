class Token
  attr_reader :start_line, :start_char
  attr_reader :end_line, :end_char
  attr_reader :type, :value
  def initialize(start_line, start_char, end_line, end_char, type, value=nil)
    @start_line = start_line
    @start_char = start_char
    @end_line = end_line
    @end_char = end_char
    @type = type
    @value = value
  end

  def inspect
    "Token<#{type},#{value.inspect}>"
  end
end
