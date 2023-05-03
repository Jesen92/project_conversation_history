# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: Projects::Comment do
    association :user
    association :project
    body { Forgery::Basic.text }
  end
end
