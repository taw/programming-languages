class LispTokenizer < Tokenizer
  def get_next_token
    if @s.scan(/\s+/)
      # next
    elsif @s.scan(/\(|\)/)
      new_token :operator, @s[0].to_sym
    elsif @s.scan(/[^()\s]+/)
      token = @s[0]
      if token =~ /\A-?\d+(\.\d*)?\z/
        new_token :number, @s[0].to_f
      else
        new_token :operator, @s[0].to_sym
      end
    else
      syntax_error
    end
  end
end
