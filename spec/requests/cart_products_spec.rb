require 'rails_helper'

RSpec.describe "CartProducts", type: :request do
  describe "GET /destroy" do
    it "returns http success" do
      get "/cart_products/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/cart_products/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/cart_products/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/cart_products/show"
      expect(response).to have_http_status(:success)
    end
  end

end
