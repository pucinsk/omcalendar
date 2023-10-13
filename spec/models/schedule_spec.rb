# frozen_string_literal: true

require "rails_helper"

RSpec.describe Schedule do
  describe "#title" do
    describe "validations" do
      subject(:schedule) { build(:schedule, title:) }

      before do
        schedule.valid?
      end

      context "when title is nil" do
        let(:title) { nil }

        it { is_expected.not_to be_valid }

        describe "#errors" do
          subject(:errors) { schedule.errors.full_messages }

          it { is_expected.to contain_exactly("Title can't be blank") }
        end
      end

      context "when title is empty string" do
        let(:title) { "" }

        it { is_expected.not_to be_valid }

        describe "#errors" do
          subject(:errors) { schedule.errors.full_messages }

          it { is_expected.to contain_exactly("Title can't be blank") }
        end
      end

      context "when title is not empty string" do
        let(:title) { "I'm a title" }

        it { is_expected.to be_valid }
      end
    end

    describe ".before_save" do
      let(:schedule) { build(:schedule, title:) }

      let(:title) { "My awesome title    " }

      it "trims whitespaces from title" do
        expect { schedule.save }.to change(schedule, :title).from(title).to(title.strip)
      end
    end
  end
end
