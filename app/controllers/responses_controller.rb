class ResponsesController < ApplicationController
  load_and_authorize_resource

  def index
    @response = Response.all
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    @response.save
    redirect_to @response
  end

  def edit
    @response = Response.find(params[:id])
  end

  def show
    @response = Response.find(params[:id])
    authorize! :read, @response
  end

  def update
    @response = Response.find(params[:id])
    @response.update(response_params)
    redirect_to @response
  end

  def destroy
    authorize! :delete, @response
    @response = Response.find(params[:id])
    @response.destroy
    redirect_to responses_path
  end

  private
  def response_params
    params.require(:response).permit(:test_id, :question_id, :response)
  end

end
