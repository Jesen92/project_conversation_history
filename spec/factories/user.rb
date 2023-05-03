# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Forgery::Name.first_name }
    last_name { Forgery::Name.last_name }
    email { Forgery::Internet.email_address }
    password { 'pass123' }
    password_confirmation { 'pass123' }
  end
end
