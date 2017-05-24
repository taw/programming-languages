require "strscan"

class MathTokenizer
  def self.tokenize(str)
    tokens = []
    s = StringScanner.new(str)
    until s.eos?
      if s.scan(/\s+/)
        # next
      elsif s.scan(/\d+(\.\d*)?/)
        tokens << s[0].to_f
      elsif s.scan(Regexp.union(*%W[** * + - ( ) /]))
        tokens << s[0].to_sym
      else
        raise "Syntax Error: #{s}"
      end
    end
    tokens
  end
end
