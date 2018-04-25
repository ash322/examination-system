class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @question = Question.all
  end

  def new
    @question = Question.new
    @question.options.build
  end

  def add_option
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.paper_id = params[:papers]
    #@question.build_correct_option
    option = params[:question][:correct_option]
    correct_option = params[:question][:options_attributes][option][:body]
    @question.correct_option = @question.options.select{ |a| a.body == correct_option }.first

    respond_to do |format|
      if @question.save
        flash[:notice] = "Question was sucessfully created"
        format.html{ redirect_to @question }
      else
        flash[:error] = 'Error creating question'
        format.html { render action: :new }
      end
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    correct_option = params[:question][:correct_option]
    @question.correct_option_id = params[:question][:options_attributes][correct_option][:id]
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:question, :correct_option_id, :total_marks, :paper_id,
    options_attributes:[:body, :id])
  end
end
