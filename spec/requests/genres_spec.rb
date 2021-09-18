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
        it "should deliver two genres" do
          get '/genres'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(2)
          expect(response).to have_http_status(:ok)
        end
      end

    end

  end

  describe "GET /genres/id" do

    context "when nothig is found" do
      it "should not deliver anything" do
        get "/genres/#{rand(1..10)}"
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:not_found)
      end
    end
    context "when the searched record was found" do
      let!(:genre) { create(:genre) }
      it "should deliver one element" do
        get "/genres/#{genre.id}"
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:success)
      end
    end
    
  end

  describe "POST /genres" do
   
    context "when a don't give a param" do
      it "should return an error" do
        post "/genres"
        payload = JSON.parse(response.body)
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "when we give a param" do
      let!(:create_params) { { "genre" => { "name" => "Genero nuevo" } } }
      it "should return an ok" do
        post "/genres", params: create_params
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:ok)
      end
    end
  end
end