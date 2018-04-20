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
    @test = Test.new
    @test.start_date = Date.today.to_s
    @test.test_date = Date.today.to_s
    #@test.exam_id = params[:paper_id]
  end

  def create
    @test.user_id = current_user.id
    @test = Test.new#(test_params)
    @test.end_date = Date.today.to_s
    @test.save
    redirect_to @test
  end

  def show
    @test = Test.find(params[:id])
  end

private
  def test_params
    #params.require(:test).permit(:user_id, :start_date, :end_date, :test_date, :marks_obtained, :result, :exam_id)
  end
end
