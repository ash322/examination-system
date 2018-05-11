class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def add_paper
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def update_papers
    user = params[:id]
    paper_ids = params[:paper_ids]
    #binding.pry
    UserPaper.where(user_id:user).where.not(paper_id: paper_ids).destroy_all

    paper_ids.each do |paper_id|
      UserPaper.find_or_create_by(:user_id => user, :paper_id => paper_id)
    end
    redirect_to users_path
  end

  def manage_roles
    authorize! :manage_roles, @user, :message => "Not authorized for this page."
    @user=User.all
  end

  def update_roles
    user = params[:id]
    role_ids = params[:role_ids]

    UserRole.where(user_id: user)
    .where.not(role_id: role_ids)
    .destroy_all

    role_ids.each do |role_id|
      UserRole.find_or_create_by(:user_id => user, :role_id => role_id)
    end
    redirect_to users_manage_roles_path, notice: 'Role was sucessfully assigned.'
  end

private
  def user_params
    params.require(:user).permit(:fname, :lname,:contact,:email)
  end
end
