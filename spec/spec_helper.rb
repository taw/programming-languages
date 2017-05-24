require_relative "../lib/rpn_tokenizer"
require_relative "../lib/rpn_interpreter"

RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :should
  end
  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
end
