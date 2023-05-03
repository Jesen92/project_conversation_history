# frozen_string_literal: true

module Projects
  class Comment < ApplicationRecord
    has_rich_text :body

    belongs_to :user
    belongs_to :project
  end
end
