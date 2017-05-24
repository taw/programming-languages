class RPNTokenizer
  def self.tokenize(str)
    str.split(/\s+/).map do |token|
      if token =~ /\A-?\d+(\.\d*)?\z/
        token.to_f
      else
        token.to_sym
      end
    end
  end
end
