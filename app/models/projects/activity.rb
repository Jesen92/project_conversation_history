# frozen_string_literal: true

module Projects
  class Activity < ApplicationRecord
    belongs_to :user
    belongs_to :project
  end
end
