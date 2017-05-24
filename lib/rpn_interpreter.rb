class RPNInterpreter
  def self.run(str)
    tokens = RPNTokenizer.tokenize(str)
    stack = []
    until tokens.empty?
      case token = tokens.shift
      when Numeric
        stack << token
      when :+, :-, :/, :*
        b = stack.pop
        a = stack.pop
        stack << a.send(token, b)
      else
        raise "Syntax Error: Unknown token #{token}"
      end
    end
    stack.last
  end
end
