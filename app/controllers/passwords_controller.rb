#encoding: utf-8
class PasswordsController < ApplicationController
  skip_before_filter :require_admin, only: [:edit, :update]
  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(params[:user_id])

  	if @user.update_attributes(get_update_attributes)
		redirect_to password_edit_path, notice: 'Contraseña Actualizada Satisfactoriamente'
	else
		render 'edit'
	end
  end

  private
  def get_update_attributes
  	params.require(:user).permit(:password, :password_confirmation)
  end
end
