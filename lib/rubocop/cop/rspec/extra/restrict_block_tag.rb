# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      module Extra
        # Restrict to only allowed block tags.
        #
        # @example AllowTags: ['foo', 'bar']
        #   # bad
        #   RSpec.describe 'Something', :baz do
        #   end
        #
        #   # bad
        #   RSpec.describe 'Something' do
        #     context 'when something', baz: :foo do
        #     end
        #   end
        #
        #   # good
        #   RSpec.describe 'Something', :foo do
        #   end
        #
        #   # good
        #   RSpec.describe 'Something' do
        #     context 'when something', bar: :foo do
        #     end
        #   end
        #
        class RestrictBlockTag < Base
          include Metadata

          def on_metadata(symbols, pairs)
            offenses = (symbols + pairs.map(&:key)).filter do |symbol|
              !allow_tags.include?(symbol.value.to_s)
            end

            return unless offenses.any?

            offenses.each do |offense|
              add_offense(offense, message: offense_message)
            end
          end

          private

          def offense_message
            if allow_tags.any?
              format("This tag is not allowed. Allowed tags: %<allow_tags>s.", allow_tags: allow_tags.join(", "))
            else
              "Tags are not allowed."
            end
          end

          def allow_tags
            cop_config.fetch("AllowTags", [])
          end
        end
      end
    end
  end
end
