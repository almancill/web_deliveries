class UsersController < ApplicationController

  skip_before_filter :require_admin, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)
    if @user.save
      redirect_to :root, notice: "usuario #{@user.username} #{@user.password} fue registrado"
    else
      render 'new'
    end
  end

  def edit
  end

  def  update
    if current_user.update_attributes(update_user_params)
      redirect_to :root, notice: "Usuario editado satisfactoriamente"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render nothing: true
  end

  private
  def create_user_params
    params.require(:user).permit(:name, :email, :username, :admin)
  end

  def update_user_params
    params.require(:user).permit(:name, :email)
  end
end