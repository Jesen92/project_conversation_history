# frozen_string_literal: true

module Projects
  class Form < Core::Forms::BaseForm
    params do
      required(:title).filled(:string)
      required(:description).filled(:string)
    end
  end
end
