# frozen_string_literal: true

class Project < ApplicationRecord
  has_rich_text :description

  STATUSES = %w[
    to_do
    in_progress
    blocked
    done
  ].freeze

  has_many :activities, class_name: 'Projects::Activity'
end
