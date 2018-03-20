class MathParser < Parser
  def initialize(str)
    @str = str
    @tokens = MathTokenizer.tokenize(str)
  end

  def parse_value
    if @tokens[0].value == :"("
      @tokens.shift
      result = parse_expr
      raise unless @tokens[0].value == :")"
      @tokens.shift
      result
    elsif @tokens[0].type == :number
      @tokens.shift.value
    # These are _probably_ not sufficiently generic rules
    elsif @tokens[0].value == :-
      @tokens.shift
      [:uminus, parse_value]
    elsif @tokens[0].value == :+
      @tokens.shift
      [:uplus, parse_value]
    else
      raise "Syntax Error: #{@tokens.inspect}"
    end
  end

  def parse_factor
    a = parse_value
    while @tokens[0] and (@tokens[0].value == :* or @tokens[0].value == :/)
      tok = @tokens.shift.value
      a = [tok, a, parse_value]
    end
    a
  end

  def parse_expr
    a = parse_factor
    while @tokens[0] and (@tokens[0].value == :+ or @tokens[0].value == :-)
      tok = @tokens.shift.value
      a = [tok, a, parse_factor]
    end
    a
  end

  def parse
    result = parse_expr
    raise "Extra tokens left: #{@tokens.inspect}" unless @tokens.empty?
    result
  end
end
