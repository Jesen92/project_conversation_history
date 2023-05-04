# frozen_string_literal: true

module ProjectsHelper
  STATUS_BACKGROUND_COLOR = {
    to_do: 'bg-secondary',
    in_progress: 'bg-primary',
    blocked: 'bg-danger',
    done: 'bg-success'
  }.freeze

  def format_activity_type(type)
    type.split(':').last.downcase
  end

  def status_background_color(status)
    STATUS_BACKGROUND_COLOR[status.to_sym]
  end
end
