# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Forgery::Name.full_name }
    description { Forgery::Basic.text }
  end
end
