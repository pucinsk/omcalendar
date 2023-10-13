# frozen_string_literal: true

10.times { Schedule.create }
TaskTemplate.create(name: "One Off", type: "one_off", config: {})

Schedule.find_each do |schedule|
  SecureRandom.random_number(30).times do
    Task.create(
      title: "Call #{Faker::Fantasy::Tolkien.character}",
      schedule:,
    )
  end
end
