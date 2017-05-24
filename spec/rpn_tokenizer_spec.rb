describe RPNTokenizer do
  it "numbers" do
    RPNTokenizer.tokenize("2 3 4 -5 7.2 3.14 -9.8").should == [2, 3, 4, -5, 7.2, 3.14, -9.8]
  end

  it "symbols" do
    RPNTokenizer.tokenize("+ - * / **").should == [:+, :-, :*, :/, :**]
  end

  it "ignores extra spacing" do
    RPNTokenizer.tokenize("2 2   +\n3 *").should == [2, 2, :+, 3, :*]
  end
end
