# frozen_string_literal: true

# == Schema Information
#
# Table name: todos_tasks
#
#  state :enum             default("started"), not null
#  title :string
#
FactoryBot.define do
  factory :task, class: "Todos::Task" do
    title { "MyString" }
  end
end
