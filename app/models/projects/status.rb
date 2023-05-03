# frozen_string_literal: true

module Projects
  class Status < Activity
    store_accessor :data, :changed_from, :changed_to

    validates :changed_from, presence: true
    validates :changed_to, presence: true
  end
end
