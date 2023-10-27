# frozen_string_literal: true

class AddStatusToTodosTasks < ActiveRecord::Migration[7.1]
  def change
    create_enum :state, %w[started completed]

    change_table :todos_tasks do |t|
      t.enum :state, enum_type: :state, default: "started", null: false
    end
  end
end
