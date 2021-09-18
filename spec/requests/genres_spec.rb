require "rails_helper"

RSpec.describe "Genres", type: :request do

  describe "GET /genres" do

    context "when no genres" do
      it "should not deliver anything" do
        get '/genres'
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:ok)
      end
    end
    context "when there are genres" do
      
      context "when there is only genre" do
        let!(:first_genre) { create(:genre) }
        it "should deliver only one genre" do
          get '/genres'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(1)
          expect(response).to have_http_status(:ok)
        end
      end
      context "when there are two genres" do
        let!(:first_genre) { create(:genre) }
        let!(:second_genre) { create(:genre) }
        it "should deliver only one genre" do
          get '/genres'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(2)
          expect(response).to have_http_status(:ok)
        end
      end

    end

  end
end