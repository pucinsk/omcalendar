# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :task
end

# == Schema Information
#
# Table name: items
#
#  duration  :integer          not null
#  starts_at :datetime         not null
#  status    :string
#  task_id   :uuid             not null
#
