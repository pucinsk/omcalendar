# frozen_string_literal: true

require "rails_helper"

RSpec.describe SchedulesController do
  describe "GET schedules#index" do
    before { get "index" }

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET schedules#show'" do
    let(:schedule) { create(:schedule) }

    before { get "show", params: { id: schedule.id } }

    it "renders show template" do
      expect(response).to render_template(:show)
    end

    it "assigns @schedule to found instance by id" do
      expect(assigns(:schedule)).to eq(schedule)
    end

    context "when schedule is not found" do
      render_views
      let(:schedule) { instance_double(Schedule, id: "NOT_FOUND") }

      it "has 404 status" do
        expect(response).to have_http_status(:not_found)
        expect(response.body).to match(/Resource not found/i)
      end

      it "renders not found resource template" do
        expect(response).to render_template("errors/404")
      end
    end
  end

  describe "GET schedule#new" do
    before { get "new" }

    it "assigns @schedule to new instance" do
      expect(assigns(:schedule)).to be_a_new(Schedule)
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST schedules#create" do
    subject(:create_request) { post "create", params: }

    let(:params) { { schedule: { title: "Valid title" } } }

    it "creates new Schedule" do
      expect { create_request }.to change(Schedule, :count).by(1)
      expect(Schedule.last).to have_attributes(title: params[:schedule][:title])
    end

    context "when bad params are given" do
      let(:params) { { schedule: { title: "" } } }

      it "does not create new Schedule" do
        expect { create_request }.not_to change(Schedule, :count)
      end

      it "renders new template" do
        create_request
        expect(response).to render_template(:new)
      end
    end
  end
end
