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

  def manage_roles
    authorize! :manage_roles, @user, :message => "Not authorized for this page."
    @user=User.all
  end

  def update_roles
    user = params[:id]
    role_ids = params[:role_ids]

    UserRole.where(user_id:user)
    .where.not(role_id: role_ids)
    .destroy_all

    role_ids.each do |role_id|
      UserRole.find_or_create_by(:user_id => user,:role_id => role_id)
    end
    redirect_to users_manage_roles_path, notice: 'Roles were sucessfully assigned.'
  end

private
  def user_params
    params.require(:user).permit(:fname, :lname,:contact,:email)
  end
end
#
# params[:user]={fname: '', lname: '' ...}
#
# def user_roles_params
#   params.require(:user).permit(roles_attributes: [:user_id, role_id])
# end
#
# params[:user][:roles_attributes] = {"0": {user_id: 234, role_id: 23},
#                                     "1": {user_id: 234, role_id: 23}}
