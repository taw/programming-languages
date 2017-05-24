describe LispTokenizer do
  it "empty string" do
    LispTokenizer.tokenize("").should == []
  end

  it "numbers" do
    LispTokenizer.tokenize("2 3 4 -5 7.2 3.14 -9.8").should == [2, 3, 4, -5, 7.2, 3.14, -9.8]
  end

  it "symbols" do
    LispTokenizer.tokenize("+ - * / **").should == [:+, :-, :*, :/, :**]
  end

  it "spacing" do
    LispTokenizer.tokenize("2 +  3   \n- 4").should == [2, :+, 3, :-, 4]
    LispTokenizer.tokenize("2+3*4").should == [:"2+3*4"]
  end

  it "parenthesis" do
    LispTokenizer.tokenize("(1+ (+ 2 3))").should == [:"(", :"1+", :"(", :+, 2, 3, :")", :")"]
  end
end
