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

  def create
    @test = Test.new(test_params)
    @test.exam_id = params[:test][:paper_id]
    @test.user_id = current_user.id
    @test.start_date = params[:test][:start_date]
    @test.test_date = Date.today
    @test.end_date = Date.today
    if params[:test][:responses_attributes] == nil
      flash[:error] = 'Attempt atleast a question'
      render action: :new
    end
    length = params[:test][:responses_attributes].keys.length

    @test.marks_obtained = 0

    for i in 0..length-1 do
      @test.responses[i].question_id = id = params[:test][:responses_attributes].keys[i]
      q = Question.find(id)
      if @test.responses[i].response == q.correct_option_id.to_s
        @test.marks_obtained += q.total_marks
      end
    end

    percentage = (@test.marks_obtained*100)/(length*100)
    if percentage >=70
      @test.result = true
    else
      @test.result = false
    end

    respond_to do |format|
      if @test.save
        flash[:notice] = "Test Complete"
        format.html { redirect_to @test }
      else
        flash[:error] = 'Error completing Test'
        format.html { render action: :index }
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
