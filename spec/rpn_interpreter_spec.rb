describe RPNInterpreter do
  it "empty program" do
    RPNInterpreter.run("").should == nil
  end

  it "addition and subtraction" do
    RPNInterpreter.run("2 2 + 1 -").should == 3
  end

  it "multiplication and division" do
    RPNInterpreter.run("3 10 4 * /").should == (3.0/40.0)
  end
end
