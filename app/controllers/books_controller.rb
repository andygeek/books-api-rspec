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
    begin
      Author.find(create_params[:author_id]) && Genre.find(create_params[:genre_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Datos erroneos" } , status: :bad_request
    else
      @book = Book.create(create_params)
      render json: @book, status: :ok
    end
  end 

  private

  def create_params
    params.require(:book).permit(:title, :year, :genre_id, :author_id)
  end
end