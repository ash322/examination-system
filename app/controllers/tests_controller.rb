class TestsController < ApplicationController
  load_and_authorize_resource

  def index
    @test = Test.all
  end

  def welcome
    @test=Test.new
  end

  def process_welcome
    @paper_id=params[:papers]
    redirect_to new_paper_test_path(@paper_id)
  end

  def new
    id = params[:paper_id]
    paper = Paper.find(id)
    @question = paper.questions
    @test = Test.new
    @test.responses.build
  end

  def result
    @id=params[:id]
    @test=Test.find(@id)
    @question = @test.questions
  end

  def create
    @test = Test.new(test_params)
    @test.exam_id = params[:test][:paper_id]
    @test.user_id = current_user.id
    @test.start_date = params[:test][:start_date]
    @test.test_date = Date.today
    @test.end_date = Date.today

    respond_to do |format|
      if @test.save
        format.html { render action: :thanks , notice: 'Test was successfully created.'}
      else
        flash[:error] = 'Error completing Test'
        format.html { render action: :new }
      end
    end
  end

  def show
    @test = Test.find(params[:id])
  end

  private
  def test_params
    params.require(:test).permit(:user_id, :start_date, :end_date, :test_date, :marks_obtained, :result, :exam_id, responses_attributes:[:id,:test_id,:question_id,:response])
  end
end
