# frozen_string_literal: true

module Projects
  module StatusUpdate
    class Action
      def initialize(form:, project:)
        @form = form
        @project = project
      end

      def call
        project.update!(form.to_h)
        project
      end

      private

      attr_reader :form, :project
    end
  end
end
