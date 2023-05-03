class Project < ApplicationRecord
  has_rich_text :description

  STATUSES = %w[
    to_do
    in_progress
    blocked
    done
  ]

end
