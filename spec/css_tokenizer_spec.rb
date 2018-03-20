describe CssTokenizer do
  it "empty string" do
    should_tokenize_to("")
  end

  it "selector words" do
    should_tokenize_to("h1",
      [:word, "h1"],
    )
    should_tokenize_to("h1.blue",
      [:word, "h1.blue"],
    )
    should_tokenize_to("h1.blue#header",
      [:word, "h1.blue#header"],
    )
  end

  it "multiple selectors" do
    should_tokenize_to("ol li,ul li", 
      [:word, "ol"],
      [:word, "li"],
      [:comma],
      [:word, "ul"],
      [:word, "li"],    
    )
  end

  it "simple rule" do
    should_tokenize_to("h1 { width: 40px; }", 
      [:word, "h1"],
      [:open],
      [:word, "width"],
      [:colon],
      [:word, "40px"],
      [:semicolon],
      [:close],
    )
  end
end
