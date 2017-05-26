require "strscan"

class RPNTokenizer
  def self.tokenize(str)
    tokens = []
    s = StringScanner.new(str)
    until s.eos?
      if s.scan(/\s+/)
        # next
      elsif s.scan(/-?\d+(\.\d*)?/)
        tokens << s[0].to_f
      elsif s.scan(/\S+/)
        tokens << s[0].to_sym
      else
        raise "Syntax Error: #{s}"
      end
    end
    tokens
  end
end
