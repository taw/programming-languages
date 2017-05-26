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

  def self.tokenize(str)
    new(str).tokenize
  end
end
