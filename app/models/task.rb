# frozen_string_literal: true

class Task < ApplicationRecord
  include AASM

  belongs_to :schedule
  has_many :items, dependent: :destroy

  aasm column: "status" do
    state :draft, initial: true
    state :open
    state :in_progress
    state :done
    state :cancelled
  end
end
