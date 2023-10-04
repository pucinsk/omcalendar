# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules, id: :uuid do |t|
      t.timestamps
    end
  end
end