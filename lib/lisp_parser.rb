class LispParser
  def initialize(str)
    @str = str
    @tokens = LispTokenizer.tokenize(str)
  end

  def parse
    return nil if @tokens.empty?
    res = if @tokens[0].value == :"("
      @tokens.shift
      result = []
      until @tokens.empty? or @tokens[0].value == :")"
        result << parse
      end
      if @tokens[0].value == :")"
        @tokens.shift
        result
      else
        raise "Syntax Error: Expected )"
      end
    elsif @tokens[0].value == :")"
      raise "Syntax Error: Unexpected ("
    else
      @tokens.shift.value
    end
    res
  end

  def self.parse(str)
    new(str).parse
  end
end
