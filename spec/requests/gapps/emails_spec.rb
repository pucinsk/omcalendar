# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Gapps::Emails" do
  describe "GET /index" do
    it "returns http success" do
      get "/gapps/emails/index"
      expect(response).to have_http_status(:success)
    end
  end
end
