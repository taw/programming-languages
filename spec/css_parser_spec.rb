describe CssParser do
  it do
    CssParser.parse("").should == []
  end

  it do
    CssParser.parse("p{}").should == [
      CssRule.new(selectors: [["p"]], properties: [])
    ]
  end

  it do
    CssParser.parse("ul li img { margin: 2px;} ").should == [
      CssRule.new(
        selectors: [["ul", "li", "img"]],
        properties: [CssProperty.new(key: "margin", value: ["2px"])]
      )
    ]
  end

  it do
    CssParser.parse("h1.blue, #logo h6 { border: 4px solid blue; }").should == [
      CssRule.new(
        selectors: [["h1.blue"], ["#logo", "h6"]],
        properties: [CssProperty.new(key: "border", value: ["4px", "solid", "blue"])],
      ),
    ]
  end

  it do
    CssParser.parse("a { color: green; text-decoration: underline;} div {margin: 0;padding: 0;}").should == [
      CssRule.new(
        selectors: [["a"]],
        properties: [
          CssProperty.new(key: "color", value: ["green"]),
          CssProperty.new(key: "text-decoration", value: ["underline"]),
        ]
      ),
      CssRule.new(
        selectors: [["div"]],
        properties: [
          CssProperty.new(key: "margin", value: ["0"]),
          CssProperty.new(key: "padding", value: ["0"]),
        ],
      ),
    ]
  end
end
