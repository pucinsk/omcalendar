# frozen_string_literal: true

class CreateTodosTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :todos_tasks, id: :uuid do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
