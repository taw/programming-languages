require_relative "../lib/rpn_tokenizer"

RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :should
  end
  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
end
