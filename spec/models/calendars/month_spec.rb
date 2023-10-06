# frozen_string_literal: true

require "rails_helper"

RSpec.describe Calendars::Month do
  subject(:month) { described_class.new(date) }

  let(:date) { "2023-10-15".to_date }

  describe "#days" do
    subject(:days) { month.days }

    it { is_expected.to be_a(Array) }

    it "has 30 days" do
      expect(days.count).to be(31)
    end
  end

  # rubocop:disable Style/WordArray

  describe "#days_by_week" do
    subject(:days_by_week) { month.days_by_week }

    it do
      expect(days_by_week).to match_array(
        [
          ["2023-10-01"],
          ["2023-10-02", "2023-10-03", "2023-10-04", "2023-10-05", "2023-10-06", "2023-10-07", "2023-10-08"],
          ["2023-10-09", "2023-10-10", "2023-10-11", "2023-10-12", "2023-10-13", "2023-10-14", "2023-10-15"],
          ["2023-10-16", "2023-10-17", "2023-10-18", "2023-10-19", "2023-10-20", "2023-10-21", "2023-10-22"],
          ["2023-10-23", "2023-10-24", "2023-10-25", "2023-10-26", "2023-10-27", "2023-10-28", "2023-10-29"],
          ["2023-10-30", "2023-10-31"],
        ].map { _1.map(&:to_date) },
      )
    end
  end
  # rubocop:enable Style/WordArray

  describe "#weeks_count" do
    subject(:weeks_count) { month.weeks_count }

    it { is_expected.to eq(6) }
  end
end
