# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items, id: :uuid do |t|
      t.references :task, null: false, foreign_key: true, type: :uuid
      t.datetime :starts_at, null: false
      t.integer :duration, null: false
      t.string :status
      t.timestamps
    end
  end
end
