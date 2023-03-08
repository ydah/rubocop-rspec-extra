# frozen_string_literal: true

module RuboCop
  module RSpec
    module Extra
      module Inject
        def self.defaults!
          path = CONFIG_DEFAULT.to_s
          hash = ::RuboCop::ConfigLoader.send(:load_yaml_configuration, path)
          config = ::RuboCop::Config.new(hash, path).tap(&:make_excludes_absolute)
          puts "configuration from #{path}" if ::RuboCop::ConfigLoader.debug?
          config = ::RuboCop::ConfigLoader.merge_with_default(config, path)
          ::RuboCop::ConfigLoader.instance_variable_set(:@default_configuration, config)
        end
      end
    end
  end
end
