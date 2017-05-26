class MathTokenizer < Tokenizer
  def get_next_token
    if @s.scan(/\s+/)
      # next
    elsif @s.scan(/\d+(\.\d*)?/)
      new_token :number, @s[0].to_f
    elsif @s.scan(Regexp.union(*%W[** * + - ( ) /]))
      new_token :operator, @s[0].to_sym
    else
      syntax_error
    end
  end
end
