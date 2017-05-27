describe MathTokenizer do
  it "empty string" do
    MathTokenizer.tokenize("").should == []
  end

  it "numbers" do
    MathTokenizer.tokenize("2 3 4 -5 7.2 3.14 -9.8").map(&:value).should == [2, 3, 4, :-, 5, 7.2, 3.14, :-, 9.8]
  end

  it "symbols" do
    MathTokenizer.tokenize("+ - * / **").map(&:value).should == [:+, :-, :*, :/, :**]
  end

  it "spacing" do
    MathTokenizer.tokenize("2 +  3   \n- 4").map(&:value).should == [2, :+, 3, :-, 4]
    MathTokenizer.tokenize("2+3*4").map(&:value).should == [2, :+, 3, :*, 4]
  end

  it "parenthesis" do
    MathTokenizer.tokenize("(2 +  (3-4))").map(&:value).should == [:"(", 2, :+, :"(", 3, :-, 4, :")", :")"]
  end

  it "syntax error" do
    proc{
      MathTokenizer.tokenize("2 + fail")
    }.should raise_error("Syntax Error at 1:5: fail")
  end
end
