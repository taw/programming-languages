class JsonTokenizer < Tokenizer
  def get_next_token
    if @s.scan(/\s+/)
      # next
    elsif @s.scan(/,/)
      new_token :comma
    elsif @s.scan(/\{/)
      new_token :obj_open
    elsif @s.scan(/\}/)
      new_token :obj_close
    elsif @s.scan(/\[/)
      new_token :array_open
    elsif @s.scan(/\]/)
      new_token :array_close
    elsif @s.scan(/:/)
      new_token :colon
    elsif @s.scan(/true/)
      new_token :value, true
    elsif @s.scan(/false/)
      new_token :value, false
    elsif @s.scan(/null/)
      # .compact silliness
      new_token :value, :null
    elsif @s.scan(/-?\d+\.\d+/)
      new_token :value, @s[0].to_f
    elsif @s.scan(/-?\d+/)
      new_token :value, @s[0].to_i
    elsif @s.scan(/"(.*?)"/)
      new_token :value, @s[1].gsub("\\n", "\n")
    else
      syntax_error
    end
  end
end
