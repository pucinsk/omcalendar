# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  duration         :integer
#  starts_at        :datetime
#  status           :string
#  title            :string
#  parent_id        :uuid             not null
#  schedule_id      :uuid             not null
#  task_template_id :uuid             not null
#
FactoryBot.define do
  factory :task do
    title { "MyString" }
    schedule { nil }
  end
end
