class RPNInterpreter
  def self.run(str)
    tokens = RPNTokenizer.tokenize(str)
    stack = []
    until tokens.empty?
      token = tokens.shift
      case token.type
      when :number
        stack << token.value
      when :operator
        b = stack.pop
        a = stack.pop
        stack << a.send(token.value, b)
      else
        raise "Syntax Error: Unknown token #{token}"
      end
    end
    stack.last
  end
end
