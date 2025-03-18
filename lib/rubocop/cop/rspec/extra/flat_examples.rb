# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      module Extra
        # Restrict unnecessary nesting by example groups.
        #
        # @example
        #   # bad
        #   context 'when condition' do
        #     it 'tests something' do
        #     end
        #   end
        #
        #   # good
        #   it 'tests something when condition' do
        #   end
        #
        class FlatExamples < Base
          MSG = "Unnecessary nesting by example groups detected."

          # @!method redundant?(node)
          def_node_matcher :redundant?, <<~PATTERN
            (block (send #rspec? #ExampleGroups.regular ...) _ (block (send _ #Examples.regular ...) ...))
          PATTERN

          def on_block(node) # rubocop:disable InternalAffairs/NumblockHandler
            return unless redundant?(node)

            add_offense(node)
          end
        end
      end
    end
  end
end
