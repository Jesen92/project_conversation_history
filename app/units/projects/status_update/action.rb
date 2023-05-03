# frozen_string_literal: true

module Projects
  module StatusUpdate
    class Action
      def initialize(form:, project:, current_user:)
        @form = form
        @project = project
        @current_user = current_user
      end

      def call
        changed_from = project.status
        project.update!(form.to_h)
        create_project_status(changed_from)
        project
      end

      private

      attr_reader :form, :project, :current_user

      def create_project_status(changed_from)
        Projects::Status.create(changed_from: changed_from, 
                                changed_to: form[:status], 
                                user: current_user,
                                project: project)
      end
    end
  end
end
