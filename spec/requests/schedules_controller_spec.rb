# frozen_string_literal: true

require "rails_helper"

RSpec.describe SchedulesController do
  describe "get '/'" do
    it "redirects to schedules list page" do
      get "/"
      expect(response).to render_template(:index)
    end
  end

  describe "get '/schedules/:UUID'" do
    it "redirects to schedules show page" do
      get "/schedules/test-id"
      expect(response).to render_template(:show)
    end
  end
end
