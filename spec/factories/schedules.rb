# frozen_string_literal: true

# == Schema Information
#
# Table name: schedules
#
#  description :text
#  title       :string
#
FactoryBot.define do
  factory :schedule do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.sentence }
  end
end
