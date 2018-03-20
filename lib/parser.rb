class Parser
  def next_token_type
    return :eof if @tokens.empty?
    @tokens[0].type
  end

  def shift_token(type)
    raise "Expected token #{type}, got #{next_token_type}" unless next_token_type == type
    return nil if @tokens.empty?
    @tokens.shift.value
  end

  def self.parse(str)
    new(str).parse
  end
end
