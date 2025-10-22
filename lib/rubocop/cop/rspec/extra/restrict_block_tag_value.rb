# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      module Extra
        # Restrict to only allowed block tag value.
        #
        # @example AllowTagValues: { foo: 'baz' }
        #   # bad
        #   RSpec.describe 'Something', foo: :bar do
        #   end
        #
        #   # good
        #   RSpec.describe 'Something', foo: :baz do
        #   end
        #
        class RestrictBlockTagValue < Base
          include Metadata

          MSG = "This value is not allowed in this tag. Allowed tag value: %<allow_tag_value>s."

          def on_metadata(_symbols, hash)
            return if hash.nil?

            offenses = hash.pairs.filter do |pair|
              allow_tag_values.any? do |k, v|
                pair.key.value.to_s == k &&
                  pair.value.value.to_s != v
              end
            end

            return unless offenses.any?

            offenses.each do |offense|
              add_offense(offense, message: format(MSG, allow_tag_value: allow_tag_values[offense.key.value.to_s]))
            end
          end

          private

          def allow_tag_values
            cop_config.fetch("AllowTagValues", {})
          end
        end
      end
    end
  end
end
