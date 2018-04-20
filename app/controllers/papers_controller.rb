class PapersController < ApplicationController
  def index
    @paper = Paper.all
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.save
    redirect_to @paper
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    @paper.update(paper_params)
    redirect_to @paper
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy
    redirect_to papers_path
  end

  private
  def paper_params
    params.require(:paper).permit(:name)
  end
end
