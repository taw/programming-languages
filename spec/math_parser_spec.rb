describe MathParser do
  it "chaining" do
    MathParser.parse("2-3-4").should == [:-, [:-, 2, 3], 4]
  end

  it "precedence" do
    MathParser.parse("2+3*4").should == [:+, 2, [:*, 3, 4]]
  end

  it "parentheses" do
    MathParser.parse("(2+3)*4").should == [:*, [:+, 2, 3], 4]
  end

  it "unary +/-" do
    MathParser.parse("-2 * -3 + +4").should == [:+, [:*, [:uminus, 2], [:uminus, 3]], [:uplus, 4]]
  end

  it do
    MathParser.parse("2*3*4-5*6+7").should == [
      :+,
        [:-,
          [:*, [:*, 2, 3], 4],
          [:*, 5, 6]],
      7]
  end
end
