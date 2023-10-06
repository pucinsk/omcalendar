# frozen_string_literal: true

require "rails_helper"

RSpec.describe Calendars::Week do
  subject(:week) { described_class.new(date:) }

  describe "#days" do
    subject(:days) { week.days }

    context "when date is within full week" do
      let(:date) { "2023-10-15".to_date }

      it "returns week with all days present" do
        expect(days).to match_array(%w[
          2023-10-09
          2023-10-10
          2023-10-11
          2023-10-12
          2023-10-13
          2023-10-14
          2023-10-15
        ].map(&:to_date))
      end
    end

    context "when date is not in full week" do
      context "when it is not full at the beginning" do
        let(:date) { "2023-10-01".to_date }

        it "returns week with not all days present" do
          expect(days).to contain_exactly(
            nil,
            nil,
            nil,
            nil,
            nil,
            nil,
            date,
          )
        end
      end

      context "when it is not full at the end" do
        let(:date) { "2023-10-30".to_date }

        it "returns week with not all days present" do
          expect(days).to contain_exactly(
            nil,
            nil,
            nil,
            nil,
            nil,
            date,
            date.tomorrow,
          )
        end
      end
    end
  end
end
