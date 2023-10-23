# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title
      t.datetime :starts_at
      t.integer :duration
      t.references :schedule, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
