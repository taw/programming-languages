# Location information is line/character
# * both indexed from 1
# * \r not handled in any way whatsoever
# * range is .., so 10/20..10/20 is a length 1 token
#   * no special support for zero length tokens
#   * tokens ending in \n would probably be funny
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
    "Token<#{type},#{value.inspect},#{@start_line}/#{@start_char}..#{@end_line}/#{@end_char}>"
  end

  def ==(other)
    other.class == self.class &&
    other.start_line == self.start_line &&
    other.start_char == self.start_char &&
    other.end_line == self.end_line &&
    other.end_char == self.end_char &&
    other.type == self.type &&
    other.value == self.value
  end
end
