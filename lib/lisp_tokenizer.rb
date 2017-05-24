require "strscan"

class LispTokenizer
  def self.tokenize(str)
    tokens = []
    s = StringScanner.new(str)
    until s.eos?
      if s.scan(/\s+/)
        # next
      elsif s.scan(/\(|\)/)
        tokens << s[0].to_sym
      elsif s.scan(/[^()\s]+/)
        token = s[0]
        if token =~ /\A-?\d+(\.\d*)?\z/
          tokens << token.to_f
        else
          tokens << token.to_sym
        end
      else
        raise "Syntax Error: #{s}"
      end
    end
    tokens
  end
end