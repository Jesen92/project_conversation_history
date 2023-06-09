# frozen_string_literal: true

module Projects
  module Comments
    module Create
      class Form < Core::Forms::BaseForm
        params do
          required(:project_id).filled(:integer)
          required(:body).filled(:string)
        end

        rule(:project_id) do
          unless Project.find_by(id: value).present?
            key.failure(I18n.t('.validation.projects.errors.record_not_exist',
                               record: 'Project', id: value))
          end
        end
      end
    end
  end
end
