class AuthorsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: [], status: :not_found
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
end