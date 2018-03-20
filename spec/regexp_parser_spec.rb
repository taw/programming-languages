describe RegexpParser do
  it "empty regexp" do
    RegexpParser.parse("").should == [:seq]
  end

  it "just some characters" do
    RegexpParser.parse("abc").should == [:seq,
      [:char, "a"],
      [:char, "b"],
      [:char, "c"],
    ]
  end

  it "stars" do
    RegexpParser.parse("a+b?").should == [:seq,
      [:multiple, [:char, "a"], 1, nil],
      [:multiple, [:char, "b"], 0, 1],
    ]
  end
end
