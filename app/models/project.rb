# frozen_string_literal: true

class Project < ApplicationRecord
  has_rich_text :description

  STATUSES = %w[
    to_do
    in_progress
    blocked
    done
  ].freeze

  has_many :comments, class_name: 'Projects::Comment'
end
