# frozen_string_literal: true

module Projects
  module Comments
    module Destroy
      class Action
        def initialize(comment:)
          @comment = comment
        end

        def call
          comment.destroy
        end

        private

        attr_reader :comment
      end
    end
  end
end
