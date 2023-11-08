# frozen_string_literal: true

require "rails_helper"

RSpec.describe Todos::Task do
  subject(:task) { build(:task) }

  describe "#title" do
    describe "validations" do
      context "when title is given" do
        subject(:task) { build(:task, title: "Present") }

        it { is_expected.to be_valid }
      end

      context "when title is nil" do
        subject(:task) { build(:task, title: nil) }

        it { is_expected.not_to be_valid }
      end

      context "when title is an empty string" do
        subject(:task) { build(:task, title: "") }

        it { is_expected.not_to be_valid }
      end
    end

    describe "before_save" do
      subject(:task) { build(:task, title:) }

      let(:title) { "   A lot of whitespaces    " }

      it "saves title without whitespaces" do
        expect { task.save }.to change(task, :title).from(title).to("A lot of whitespaces")
      end
    end
  end

  describe "#state" do
    describe "initial state" do
      it { is_expected.to be_started }
    end

    describe "#complete!" do
      it "changes state to 'complete'" do
        expect { task.complete! }.to change(task, :state).from("started").to("completed")
      end
    end
  end

  describe "#liquid_content" do
    subject(:liquid_content) { task.liquid_content }

    it { is_expected.to eq("") }
  end
end
