# frozen_string_literal: true

require "rubocop-rspec"

require_relative "rubocop/rspec/extra/inject"
require_relative "rubocop/rspec/extra/version"

require_relative "rubocop/cop/rspec/extra/be_empty"
require_relative "rubocop/cop/rspec/extra/flat_examples"
require_relative "rubocop/cop/rspec/extra/restrict_block_tag"
require_relative "rubocop/cop/rspec/extra/restrict_block_tag_value"

module RuboCop
  module RSpec
    module Extra
      PROJECT_ROOT = ::Pathname.new(__dir__).parent.expand_path.freeze
      CONFIG_DEFAULT = PROJECT_ROOT.join("config", "default.yml").freeze
      CONFIG = ::YAML.safe_load(CONFIG_DEFAULT.read).freeze
      private_constant(:CONFIG_DEFAULT, :PROJECT_ROOT)
    end
  end
end

RuboCop::RSpec::Extra::Inject.defaults!
