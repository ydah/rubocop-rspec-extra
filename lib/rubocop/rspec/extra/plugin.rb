# frozen_string_literal: true

require "lint_roller"

module RuboCop
  module RSpec
    module Extra
      # A plugin that integrates RuboCop RSpec Extra with RuboCop's plugin system.
      class Plugin < LintRoller::Plugin
        def about
          LintRoller::About.new(
            name: "rubocop-rspec-extra",
            version: Version::STRING,
            homepage: "https://github.com/ydah/rubocop-rspec-extra",
            description: "A RuboCop extension focused on enforcing RSpec. A place where no one is officially employed, but where useful cops can gather."
          )
        end

        def supported?(context)
          context.engine == :rubocop
        end

        def rules(_context)
          project_root = Pathname.new(__dir__).join("../../../..")

          LintRoller::Rules.new(type: :path, config_format: :rubocop, value: project_root.join("config", "default.yml"))
        end
      end
    end
  end
end
