class RegexpTokenizer < Tokenizer
  def get_next_token
    if @s.scan(/[a-zA-Z0-9]/)
      new_token :char, @s[0]
    elsif @s.scan(/\*/)
      new_token :multiple, [0, nil]
    elsif @s.scan(/\+/)
      new_token :multiple, [1, nil]
    elsif @s.scan(/\?/)
      new_token :multiple, [0, 1]
    elsif @s.scan(/\[([^\^\]]*)\]/)
      new_token :class, @s[1]
    elsif @s.scan(/\[\^([^\^\]]*)\]/)
      new_token :neg_class, @s[1]
    elsif @s.scan(/\(/)
      new_token :open
    elsif @s.scan(/\)/)
      new_token :close
    elsif @s.scan(/\{(\d*),(\d*)\}/)
      new_token :multiple, [@s[1].to_i, (@s[2].empty? ? nil : @s[2].to_i)]
    else
      syntax_error
    end
  end
end
