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

end