# frozen_string_literal: true

module ApplicationHelper
  def format_error(error)
    "#{error[:field].to_s.humanize} #{error[:message]}"
  end
end
