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

  describe "GET /books/{:id}/edit" do
    context "when there are two books" do
      it "should not deliver anything" do
        get "/books/#{rand(1..10)}"
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(0)
        expect(response).to have_http_status(:not_found)
      end
    end
    context "when the searched record was found" do
      let!(:book) { create(:book) }
      it "should deliver one element" do
        get "/books/#{book.id}"
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST /books" do
    
    context "when a don't give a param" do
      it "should return an error" do
        post "/books"
        payload = JSON.parse(response.body)
        expect(response).to have_http_status(:bad_request)
      end
    end
    context "when we give a param" do
      let!(:new_genre) { create(:genre) }
      let!(:new_author) { create(:author) }
      let!(:create_params) { { "book" => { "title" => Faker::Book.title,
        "year" => rand(1950..2021),
        "author_id" => new_author.id,
        "genre_id" => new_genre.id } } }

      it "should return an ok" do
        post "/books", params: create_params
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(response).to have_http_status(:ok)
      end
    end
  end
end