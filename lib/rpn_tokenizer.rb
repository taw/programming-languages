class RPNTokenizer
  def self.tokenize(str)
    str.split(/\s+/).map do |token|
      if token =~ /-?\d+(\.\d*)?/
        token.to_f
      else
        token.to_sym
      end
    end
  end
end
