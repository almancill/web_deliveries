#Encoding: utf-8
class SessionsController < ApplicationController

  before_filter :redirect_if_logged_in, except: [:destroy] 
  skip_before_filter :require_login, except: [:destroy]
  skip_before_filter :require_admin

  def create
    if @user = login(params[:username], params[:password])
      redirect_to :root
    else
      flash.now[:error] = "Nombre de usuario o contraseña incorrecta"
      render 'site/index'
    end
  end

  def destroy
    logout
    redirect_to :root
  end
end