describe RPNTokenizer do
  it "numbers" do
    RPNTokenizer.tokenize("2 3 4 -5 7.2 3.14 -9.8").map(&:value).should == [2, 3, 4, -5, 7.2, 3.14, -9.8]
  end

  it "symbols" do
    RPNTokenizer.tokenize("+ - * / **").map(&:value).should == [:+, :-, :*, :/, :**]
  end

  it "ignores extra spacing" do
    RPNTokenizer.tokenize("2 2   +\n3 *").map(&:value).should == [2, 2, :+, 3, :*]
  end

  it "tokens have line/char locations" do
    RPNTokenizer.tokenize("2 12   **\n3\n\n  \n -").should == [
      Token.new(1, 1, 1, 1, :number, 2.0),
      Token.new(1, 3, 1, 4, :number, 12.0),
      Token.new(1, 8, 1, 9, :operator, :**),
      Token.new(2, 1, 2, 1, :number, 3.0),
      Token.new(5, 2, 5, 2, :operator, :-),
    ]
  end
end
