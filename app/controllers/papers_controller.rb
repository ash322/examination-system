class PapersController < ApplicationController
  load_and_authorize_resource
  def index
    @paper = Paper.all
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    respond_to do |format|
      if @paper.save
        format.html{ redirect_to @paper, notice: 'Paper was successfully created.'  }
      else
        flash[:error] = 'Error creating paper'
        format.html { render action: :new }
      end
    end
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
