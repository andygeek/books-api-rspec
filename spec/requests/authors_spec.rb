require "rails_helper"

RSpec.describe "Authors", type: :request do

  describe "GET /authors" do
    
    context "when no authors" do
      it "should not deliver anything" do
        get '/authors'
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:ok)
      end
    end
    context "when there are authors" do
      context "when there is only author" do
        let!(:first_author) { create(:author) }
        it "should deliver only one author" do
          get '/authors'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(1)
          expect(response).to have_http_status(:ok)  
        end
      end
      context "when there are two authors" do
        let!(:first_author) { create(:author) }
        let!(:second_author) { create(:author) }
        it "should deliver two authors" do
          get '/authors'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(2)
          expect(response).to have_http_status(:ok) 
        end
      end
    end

  end

  describe "GET /authors/id" do
    
    context "when nothing is found" do
      it "should not deliver anything" do
        get "/authors/#{rand(1..10)}"
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:not_found) 
      end
    end
    context "when the searched record was found" do
      let!(:author) { create(:author) }
      it "should deliver one element" do
        get "/authors/#{author.id}"
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:success)
      end
    end
  end
end