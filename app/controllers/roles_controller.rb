class RolesController < ApplicationController
  load_and_authorize_resource

  def index
    @role = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.'}
      else
        flash[:error] = 'Error completing Role'
        format.html { render action: :new }
      end
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def show
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    @role.update(role_params)
    redirect_to @role
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path
  end

  private
  def role_params
    params.require(:role).permit(:name)
  end
end
