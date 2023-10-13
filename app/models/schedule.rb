# frozen_string_literal: true

class Schedule < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :title, presence: true

  before_save -> { title.strip! }, if: :title_changed?
end

# == Schema Information
#
# Table name: schedules
#
#  description :text
#  title       :string
#
