describe RegexpTokenizer do
  it "empty string" do
    should_tokenize_to("")
  end

  it "plain text" do
    should_tokenize_to("lol",
      [:char, "l"],
      [:char, "o"],
      [:char, "l"],      
    )
  end

  it "stars" do
    should_tokenize_to("x+y*z?",
      [:char, "x"],
      [:multiple, 1, nil],
      [:char, "y"],
      [:multiple, 0, nil],
      [:char, "z"],
      [:multiple, 0, 1],
    )
  end

  it "stars" do
    should_tokenize_to("a{5,10}b{15,}c{,20}",
      [:char, "a"],
      [:multiple, 5, 10],
      [:char, "b"],
      [:multiple, 15, nil],
      [:char, "c"],
      [:multiple, 0, 20],
    )
  end

  it "char class" do
    should_tokenize_to("[abc][^def][][^]",
      [:class, "abc"],
      [:neg_class, "def"],
      [:class, ""],
      [:neg_class, ""],
    )
  end

  it "groups" do
    should_tokenize_to("((ab))",
      [:open],
      [:open],
      [:char, "a"],
      [:char, "b"],
      [:close],
      [:close],
    )
  end
end
