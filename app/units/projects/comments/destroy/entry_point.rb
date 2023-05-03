# frozen_string_literal: true

module Projects
  module Comments
    module Destroy
      class EntryPoint
        DifferentUserComment = Class.new(StandardError)

        def initialize(comment:, current_user:)
          curent_users_comment?(current_user, comment)
          @action = Action.new(comment:)
        end

        def call
          action.call
        end

        private

        def curent_users_comment?(current_user, comment)
          raise DifferentUserComment unless current_user == comment.user
        end

        attr_reader :action
      end
    end
  end
end
