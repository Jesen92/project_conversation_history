# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Forgery::Name.full_name }
    description { Forgery::Basic.text }
    status { Project::STATUSES.first }
  end
end
