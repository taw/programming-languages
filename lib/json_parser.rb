class JsonParser < Parser
  def initialize(str)
    @str = str
    @tokens = JsonTokenizer.tokenize(str)
  end

  def parse
    parse_expr
  end

  def parse_expr
    if next_token_type == :value
      parse_value
    elsif next_token_type == :array_open
      parse_array
    elsif next_token_type == :obj_open
      parse_obj
    else
      raise "Syntax error: #{next_token_type}"
    end
  end

  def parse_value
    value = shift_token(:value)
    if value == :null
      nil
    else
      value
    end
  end

  def parse_array
    shift_token(:array_open)
    result = []
    while next_token_type != :array_close
      result << parse_expr
      # Don't allow trailing comma, as per silly spec
      break if next_token_type == :array_close
      shift_token(:comma)
    end
    shift_token(:array_close)
    result
  end

  def parse_obj
    shift_token(:obj_open)
    result = {}
    while next_token_type != :obj_close
      key = parse_value
      raise "Object keys must be strings" unless key.is_a?(String)
      shift_token(:colon)
      value = parse_expr
      raise "Duplicate key #{key}" if result.has_key?(key)
      result[key] = value
      # Don't allow trailing comma, as per silly spec
      break if next_token_type == :obj_close
      shift_token(:comma)
    end
    shift_token(:obj_close)
    result
  end
end
