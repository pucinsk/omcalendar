# frozen_string_literal: true

class Task < ApplicationRecord
  include AASM

  belongs_to :schedule

  aasm column: "status" do
    state :draft, initial: true
    state :open
    state :in_progress
    state :done
    state :cancelled
  end
end

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
