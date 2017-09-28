# frozen_string_literal: true

# TODO: when finished, run `rake generate_cops_documentation` to update the docs
module RuboCop
  module Cop
    module Lint
      # TODO: Write cop description and example of bad / good code.
      #
      # @example
      #   # bad
      #   bad_method()
      #
      #   # bad
      #   bad_method(args)
      #
      #   # good
      #   good_method()
      #
      #   # good
      #   good_method(args)
      class RequireInMethod < Cop
        # TODO: Implement the cop into here.
        #
        # In many cases, you can use a node matcher for matching node pattern.
        # See. https://github.com/bbatsov/rubocop/blob/master/lib/rubocop/node_pattern.rb
        #
        # For example
        MSG = 'Do not use `require` in method.'.freeze

        def_node_matcher :require?, <<-PATTERN
          (send nil {:require :require_relative} str)
        PATTERN

        def on_send(node)
          return unless require?(node)
          in_method = node
            .each_ancestor
            .any?{|ancestor| ancestor.def_type? || ancestor.defs_type?}
          if in_method
            add_offense(node)
          end
        end
      end
    end
  end
end
