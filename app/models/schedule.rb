# frozen_string_literal: true

class Schedule < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
