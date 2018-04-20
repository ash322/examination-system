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
    @question.save
    option = params[:question][:correct_option]
    correct_option = params[:question][:options_attributes][option][:body]
    @question.correct_option_id = @question.options.where(body: correct_option).first.id
    @question.save
    redirect_to @question
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
