class OptionsController < ApplicationController
  def index
    @option = Option.all
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    @option.save
    redirect_to @option
  end

  def show
    @option = Option.find(params[:id])
  end

  private
  def option_params
    params.require(:option).permit(:body)
  end
end
