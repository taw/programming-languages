require "strscan"

class Tokenizer
  def initialize(str)
    @str = str
  end

  def tokenize
    @tokens = []
    @s = StringScanner.new(@str)
    until @s.eos?
      get_next_token
    end
    @tokens
  end

  def new_token(type, value=nil)
    @tokens << Token.new(nil, nil, nil, nil, type, value)
  end

  def syntax_error
    raise "Syntax Error: #{@s}"
  end

  def self.tokenize(str)
    new(str).tokenize
  end
end
