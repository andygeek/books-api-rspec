class AuthorsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: [], status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: {error: 'No hay parametros'}, status: :bad_request
  end

  # GET /authors
  def index
    @authors = Author.all
    render json: @authors, status: :ok
  end

  # GET /authors/{id}
  def show
    @author = Author.find(params[:id])
    render json: @author, status: :ok
  end

  # POST /authors
  def create
    @author = Author.create(create_params)
    render json: @author, status: :ok
  end

  private

  def create_params
    params.require(:author).permit(:name, :last_name, :age)
  end
end