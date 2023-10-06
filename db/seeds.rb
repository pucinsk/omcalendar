# frozen_string_literal: true

# 10.times { Schedule.create }

Schedule.find_each do |schedule|
  SecureRandom.random_number(30).times { Task.create(title: "Call #{Faker::Fantasy::Tolkien.character}", schedule:) }
end
