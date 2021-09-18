class GenresController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: [], status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: {error: 'No hay parametros'}, status: :bad_request
  end

  # GET /genres
  def index
    @genres = Genre.all
    render json: @genres, status: :ok
  end

  # GET /genres/{:id}
  def show
    @genre = Genre.find(params[:id])
    render json: @genre, status: :ok
  end

  # POST /genres
  def create
    @genre = Genre.create(create_params)
    render json: @genre, status: :ok
  end

  private

  def create_params
    params.require(:genre).permit(:name)
  end
end