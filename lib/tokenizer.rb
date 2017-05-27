require "strscan"

class Tokenizer
  def initialize(str)
    @str = str
  end

  def tokenize
    @tokens = []
    @s = StringScanner.new(@str)
    @line = 1
    @char = 1
    until @s.eos?
      @pos = @s.pos
      get_next_token
      # We always need to advance parsing, regardless of getting or not getting a token
      # Anything more complex than zero or one tokens not handled here
      @line, @char = advance_position
    end
    @tokens
  end

  # This doesn't even try to deal with \r
  # It assumes you strip this crap from input before parsing
  def advance_position
    matched_fragment = @str[@pos...@s.pos]
    new_lines = matched_fragment.count("\n")
    if new_lines > 0
      characters_after_last_newline = matched_fragment.size - matched_fragment.rindex("\n") - 1
      [@line + new_lines, 1 + characters_after_last_newline]
    else
      [@line, @char + matched_fragment.size]
    end
  end

  def new_token(type, value=nil)
    next_line, next_char = advance_position
    @tokens << Token.new(@line, @char, next_line, next_char-1, type, value)
  end

  def syntax_error
    rest_size = @str.size - @pos
    if rest_size  > 100
      rest = @str[@pos, 100] + "..."
    else
      rest = @str[@pos..-1]
    end
    raise "Syntax Error at #{@line}:#{@char}: #{rest}"
  end

  def self.tokenize(str)
    new(str).tokenize
  end
end
