class BooksController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: [], status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: {error: 'No hay parametros'}, status: :bad_request
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

  # POST /books
  def create
    @book = Book.create(create_params)
    render json: @book, status: :ok
  end 

  private

  def create_params
    params.require(:book).permit(:title, :year, :genre_id, :author_id)
  end
end