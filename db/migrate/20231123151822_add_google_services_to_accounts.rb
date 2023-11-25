# frozen_string_literal: true

class AddGoogleServicesToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :google_services, :jsonb, default: {}, null: false
  end
end
