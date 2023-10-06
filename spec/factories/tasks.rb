# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { "MyString" }
    schedule { nil }
  end
end
