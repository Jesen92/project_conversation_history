# frozen_string_literal: true

module Projects
  module Comments
    module Create
      class Action
        def initialize(form:, current_user:)
          @form = form
          @current_user = current_user
        end

        def call
          Projects::Comment.create(form.to_h.merge(user_id: current_user.id))
        end

        private

        attr_reader :form, :current_user
      end
    end
  end
end
