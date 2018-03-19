# Tokenizers
require_relative "../lib/token"
require_relative "../lib/tokenizer"
require_relative "../lib/rpn_tokenizer"
require_relative "../lib/math_tokenizer"
require_relative "../lib/lisp_tokenizer"
require_relative "../lib/css_tokenizer"
require_relative "../lib/regexp_tokenizer"

# Parsers
# RPN doesn't require a parser, you can use token stream directly
require_relative "../lib/lisp_parser"
require_relative "../lib/math_parser"
require_relative "../lib/css_parser"

# Interpreters
require_relative "../lib/rpn_interpreter"

RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :should
  end
  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
end
