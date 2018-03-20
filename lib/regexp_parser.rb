class RegexpParser < Parser
  def initialize(str)
    @str = str
    @tokens = RegexpTokenizer.tokenize(str)
  end

  def parse
    result = [:seq, *parse_seq]
    shift_token(:eof)
    result
  end

  def parse_seq
    result = []
    while true
      case next_token_type
      when :open, :char, :class, :neg_class
        result << parse_atom_with_optional_multiple
      else
        break
      end
    end
    result
  end

  def parse_atom_with_optional_multiple
    atom = parse_atom
    if next_token_type == :multiple
      [:multiple, atom, *shift_token(:multiple)]
    else
      atom
    end
  end

  def parse_atom
    if next_token_type == :open
      shift_token(:open)
      result = [:seq, *parse_seq]
      shift_token(:close)
      result
    elsif next_token_type == :char
      [:char, shift_token(:char)]
    elsif next_token_type == :class
      [:class, shift_token(:class)]
    elsif next_token_type == :neg_class
      [:neg_class, shift_token(:neg_class)]
    else
      raise "Syntax error #{next_token_type}"
    end
  end
end
