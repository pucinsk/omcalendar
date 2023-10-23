# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  duration    :integer
#  starts_at   :datetime
#  status      :string
#  title       :string
#  schedule_id :uuid             not null
#
FactoryBot.define do
  factory :task do
    title { "MyString" }
    schedule { nil }
  end
end
