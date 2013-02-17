class ApplicationController < ActionController::Base
  
  protect_from_forgery

  #Filters
  before_filter :require_admin, :require_login

  #Requires
  def require_admin
    unless current_user.admin
      redirect_to :root 
      flash[:error] = "No tiene permisos para realizar esta accion"
    end
  end

  #Redirections
  def redirect_if_logged_in
    redirect_back_or_to :root if logged_in?
  end
end