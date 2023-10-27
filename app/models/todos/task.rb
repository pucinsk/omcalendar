# frozen_string_literal: true

module Todos
  class Task < ApplicationRecord
    include AASM

    validates :title, presence: true

    before_save -> { title.strip! }, if: :title_changed?

    enum state: {
      started: "started",
      completed: "completed",
    }

    aasm column: "state", enum: true do
      state :started, initial: true
      state :completed

      event :complete! do
        transitions from: :started, to: :completed
      end
    end
  end
end

# == Schema Information
#
# Table name: todos_tasks
#
#  state :enum             default("started"), not null
#  title :string
#
