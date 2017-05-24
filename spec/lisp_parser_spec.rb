describe LispParser do
  it do
    LispParser.parse("(1+ (+ 2 3))").should == [:"1+", [:+, 2, 3]]
  end

  it do
    LispParser.parse("((+ 2 3) (- 4 5))").should == [[:+, 2, 3], [:-, 4, 5]]
  end
end
