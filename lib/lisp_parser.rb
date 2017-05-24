class LispParser
  def initialize(str)
    @str = str
    @tokens = LispTokenizer.tokenize(str)
  end

  def parse
    return nil if @tokens.empty?
    res = if @tokens[0] == :"("
      @tokens.shift
      result = []
      until @tokens.empty? or @tokens[0] == :")"
        result << parse
      end
      if @tokens[0] == :")"
        @tokens.shift
        result
      else
        raise "Syntax Error: Expected )"
      end
    elsif @tokens[0] == :")"
      raise "Syntax Error: Unexpected ("
    else
      @tokens.shift
    end
    res
  end

  def self.parse(str)
    new(str).parse
  end
end
