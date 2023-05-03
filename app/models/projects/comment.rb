# frozen_string_literal: true

module Projects
  class Comment < Activity
    has_rich_text :body
  end
end
