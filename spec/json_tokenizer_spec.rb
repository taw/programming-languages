describe JsonTokenizer do
  it "empty string" do
    should_tokenize_to("")
  end

  it "basic" do
    should_tokenize_to("true",
      [:value, true],
    )
    should_tokenize_to("false",
      [:value, false],
    )
    should_tokenize_to("null",
      [:value, :null],
    )
  end

  it "numbers" do
    should_tokenize_to("0",
      [:value, 0],
    )
    should_tokenize_to("1234.56",
      [:value, 1234.56],
    )
    should_tokenize_to("-1540",
      [:value, -1540],
    )
  end

  it "strings" do
    should_tokenize_to('""',
      [:value, ""],
    )
    should_tokenize_to('"hello"',
      [:value, "hello"],
    )
    should_tokenize_to('"one\ntwo"',
      [:value, "one\ntwo"],
    )
  end

  it "arrays" do
    should_tokenize_to("[1, 2, 3]",
      [:array_open],
      [:value, 1],
      [:comma],
      [:value, 2],
      [:comma],
      [:value, 3],
      [:array_close],
    )
  end

  it "objects" do
    should_tokenize_to('{"foo": "bar", "two": 2}',
      [:obj_open],
      [:value, "foo"],
      [:colon],
      [:value, "bar"],
      [:comma],
      [:value, "two"],
      [:colon],
      [:value, 2],
      [:obj_close],
    )
  end
end
