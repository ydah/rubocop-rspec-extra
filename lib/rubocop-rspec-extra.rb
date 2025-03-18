# frozen_string_literal: true

require "rubocop-rspec"

require_relative "rubocop/rspec/extra/version"
require_relative "rubocop/rspec/extra/plugin"
require_relative "rubocop/cop/rspec/extra/be_empty"
require_relative "rubocop/cop/rspec/extra/flat_examples"
require_relative "rubocop/cop/rspec/extra/restrict_block_tag"
require_relative "rubocop/cop/rspec/extra/restrict_block_tag_value"

module Rubocop
  module RSpec
    # RuboCop RSpec Rails project namespace.
    module Extra
    end
  end
end
