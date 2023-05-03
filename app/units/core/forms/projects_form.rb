# frozen_string_literal: true

module Core
  module Forms
    class ProjectsForm < BaseForm
      params do
        required(:title).filled(:string)
        required(:description).filled(:string)
      end
    end
  end
end
