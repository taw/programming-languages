class MathParser
  def initialize(str)
    @str = str
    @tokens = MathTokenizer.tokenize(str)
  end

  def parse_value
    if @tokens[0] == :"("
      @tokens.shift
      result = parse_expr
      raise unless @tokens[0] == :")"
      @tokens.shift
      result
    elsif @tokens[0].is_a?(Numeric)
      @tokens.shift
    # These are _probably_ not sufficiently generic rules
    elsif @tokens[0] == :-
      @tokens.shift
      [:uminus, parse_value]
    elsif @tokens[0] == :+
      @tokens.shift
      [:uplus, parse_value]
    else
      raise "Syntax Error: #{@tokens.inspect}"
    end
  end

  def parse_factor
    a = parse_value
    while @tokens[0] == :* or @tokens[0] == :/
      tok = @tokens.shift
      a = [tok, a, parse_value]
    end
    a
  end

  def parse_expr
    a = parse_factor
    while @tokens[0] == :+ or @tokens[0] == :-
      tok = @tokens.shift
      a = [tok, a, parse_factor]
    end
    a
  end

  def parse
    result = parse_expr
    raise "Extra tokens left: #{@tokens.inspect}" unless @tokens.empty?
    result
  end

  def self.parse(str)
    new(str).parse
  end
end
