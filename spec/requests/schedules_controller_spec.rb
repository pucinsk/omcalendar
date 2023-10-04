# frozen_string_literal: true

require "rails_helper"

RSpec.describe SchedulesController do
  describe "get '/'" do
    it "redirects to schedules list page" do
      get "/"
      expect(response).to render_template(:index)
    end
  end
end
