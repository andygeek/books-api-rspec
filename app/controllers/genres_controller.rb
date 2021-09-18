class GenresController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: [], status: :not_found
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
end