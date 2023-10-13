# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  duration  :integer          not null
#  starts_at :datetime         not null
#  status    :string
#  task_id   :uuid             not null
#
FactoryBot.define do
  factory :item do
    task { nil }
  end
end
