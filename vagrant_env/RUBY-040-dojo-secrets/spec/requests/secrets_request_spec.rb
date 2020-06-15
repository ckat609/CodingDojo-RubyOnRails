require 'rails_helper'

RSpec.describe "Secrets", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/secrets/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/secrets/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
