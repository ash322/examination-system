class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    users_welcome_path
  end
  def after_sign_out_path_for(resource)
    users_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "/home/diptanshu/Documents/403.html", :status => 403, :layout => false
  end
end
