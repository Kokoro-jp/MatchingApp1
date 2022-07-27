class UsersController < ApplicationController

  before_action :authenticate_user!

  def account
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :img, :introduction))
      flash[:notice] = "updated your profile"
      redirect_to user_profile_path
    else
      render "profile"
    end
  end

end
