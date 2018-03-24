describe JsonParser do
  it do
    JsonParser.parse("4").should == 4
  end

  it do
    JsonParser.parse('[1, true, false, null, 2.7, "lol"]').should == [
      1,
      true,
      false,
      nil,
      2.7,
      "lol",
    ]
  end

  it do
    JsonParser.parse('{"foo": "bar", "two": 2}').should == {
      "foo" => "bar",
      "two" => 2,
    }
  end
end
