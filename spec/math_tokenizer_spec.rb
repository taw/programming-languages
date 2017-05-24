describe MathTokenizer do
  it "empty string" do
    MathTokenizer.tokenize("").should == []
  end

  it "numbers" do
    MathTokenizer.tokenize("2 3 4 -5 7.2 3.14 -9.8").should == [2, 3, 4, :-, 5, 7.2, 3.14, :-, 9.8]
  end

  it "symbols" do
    MathTokenizer.tokenize("+ - * / **").should == [:+, :-, :*, :/, :**]
  end

  it "spacing" do
    MathTokenizer.tokenize("2 +  3   \n- 4").should == [2, :+, 3, :-, 4]
    MathTokenizer.tokenize("2+3*4").should == [2, :+, 3, :*, 4]
  end

  it "parenthesis" do
    MathTokenizer.tokenize("(2 +  (3-4))").should == [:"(", 2, :+, :"(", 3, :-, 4, :")", :")"]
  end
end
