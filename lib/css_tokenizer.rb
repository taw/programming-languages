class CssTokenizer < Tokenizer
  def get_next_token
    if @s.scan(/\s+/)
      # next
    elsif @s.scan(/,/)
      new_token :comma
    elsif @s.scan(/\{/)
      new_token :open
    elsif @s.scan(/\}/)
      new_token :close
    elsif @s.scan(/;/)
      new_token :semicolon
    elsif @s.scan(/:/)
      new_token :colon
    elsif @s.scan(/[a-zA-Z0-9\.\#]+/)
      new_token :word, @s[0]
    else
      syntax_error
    end
  end
end
