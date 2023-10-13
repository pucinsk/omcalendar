# frozen_string_literal: true

# == Schema Information
#
# Table name: task_templates
#
#  config :jsonb
#  name   :string
#  type   :string
#
FactoryBot.define do
  factory :task_template do
    name { "MyString" }
    config { "" }
  end
end
