require 'rails_helper'

RSpec.describe "Api::V1::Auths", type: :request do
  describe "GET /sign_in" do
    it "returns http success" do
      get "/api/v1/auth/sign_in"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign_out" do
    it "returns http success" do
      get "/api/v1/auth/sign_out"
      expect(response).to have_http_status(:success)
    end
  end

end
