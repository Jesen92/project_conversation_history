# frozen_string_literal: true

module Projects
  module Comments
    module Create
      class Action
        def initialize(form:)
          @form = form
        end

        def call
          Projects::Comment.create(form.to_h)
        end

        private

        attr_reader :form
      end
    end
  end
end
