# frozen_string_literal: true

module Projects
  module StatusUpdate
    class Form < Core::Forms::BaseForm
      params do
        required(:status).filled(:string)
      end

      rule(:status) do
        unless Project::STATUSES.include?(value)
          key.failure(I18n.t('.validation.projects.errors.status_not_exist',
                             status: value))
        end
      end
    end
  end
end
