require "rails_helper"

RSpec.describe "Books", type: :request do

  describe "GET /books" do
    
    context "when no books" do
      it "should not deliver anything" do
        get '/books'
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:ok)
      end
    end
    context "when there are books" do
      context "when there is only book" do
        let!(:first_book) { create(:book) }
        it "should deliver only one book" do
          get '/books'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(1)
          expect(response).to have_http_status(:ok)  
        end
      end
      context "when there are two books" do
        let!(:first_book) { create(:book) }
        let!(:second_book) { create(:book) }
        it "should deliver are two books" do
          get '/books'
          payload = JSON.parse(response.body)
          expect(payload.size).to eq(2)
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end

end