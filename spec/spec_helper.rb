# frozen_string_literal: true

require "rubocop-rspec-extra"
require "rubocop/rspec/support"
require "rubocop/rspec/shared_contexts/default_rspec_language_config_context"

RSpec.configure do |config|
  config.order = :random
  config.disable_monkey_patching!
  config.raise_errors_for_deprecations!
  config.raise_on_warning = true
  config.define_derived_metadata(file_path: %r{/spec/rubocop/cop/}) do |meta|
    meta[:type] = :cop_spec
  end
  config.define_derived_metadata(type: :cop_spec) do |meta|
    meta[:config] = true
  end
  config.include_context "with default RSpec/Language config", :config
end
