# frozen_string_literal: true

class CreateTaskTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :task_templates, id: :uuid do |t|
      t.string :name
      t.string :type
      t.jsonb :config

      t.timestamps
    end
  end
end
