class BooksController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: [], status: :not_found
  end

  # GET /books
  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  # GET /books/{:id}
  def show
    @book = Book.find(params[:id])
    render json: @book, status: :ok
  end
end