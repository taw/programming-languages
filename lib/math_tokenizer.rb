class MathTokenizer < Tokenizer
  def get_next_token
    if @s.scan(/\s+/)
      # next
    elsif @s.scan(/\d+(\.\d*)?/)
      @tokens << @s[0].to_f
    elsif @s.scan(Regexp.union(*%W[** * + - ( ) /]))
      @tokens << @s[0].to_sym
    else
      raise "Syntax Error: #{@s}"
    end
  end
end
