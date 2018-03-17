CssRule = Struct.new(:selectors, :properties, keyword_init: true)
CssProperty = Struct.new(:key, :value, keyword_init: true)

class CssParser
  def initialize(str)
    @str = str
    @tokens = CssTokenizer.tokenize(str)
  end

  def parse
    rules = []
    until @tokens.empty?
      rules << parse_rule
    end
    rules
  end

  def parse_rule
    selectors = parse_selectors
    shift_token(:open)
    properties = parse_properties
    shift_token(:close)
    CssRule.new(selectors: selectors, properties: properties)
  end

  # 1 or more
  def parse_selectors
    selectors = [parse_selector]
    while next_token_type == :comma
      shift_token(:comma)
      selectors << parse_selector
    end
    selectors
  end

  def parse_selector
    selector = [shift_token(:word)]
    while next_token_type == :word
      selector << shift_token(:word)
    end
    selector
  end

  # 0 or more
  def parse_properties
    properties = []
    while next_token_type == :word
      properties << parse_property
    end
    properties
  end

  def parse_property
    key = shift_token(:word)
    shift_token(:colon)
    value = [shift_token(:word)]
    value << shift_token(:word) while next_token_type == :word
    shift_token(:semicolon)
    CssProperty.new(key: key, value: value)
  end

  def next_token_type
    return :eof if @tokens.empty?
    @tokens[0].type
  end

  def shift_token(type)
    raise "Expected token #{type}, got #{next_token_type}" unless next_token_type == type
    @tokens.shift.value
  end

  def self.parse(str)
    new(str).parse
  end
end
