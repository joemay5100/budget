class UsersController < ApplicationController
  before_action :logout_user, only: [:new]

  def new
    @user = User.new
    render :layout => 'frontpage'
  end
  
  def create 
    user_info = User.signup(user_params)
    @user = user_info[0]
    is_saved = user_info[1]

    if is_saved
      login_user(@user)
      redirect_to budget_path 
    else 
      render 'new', :layout => 'frontpage'
    end 
  end
  
  def destroy
    @user = User.find(params[:id])
    if User.delete(@user)
      redirect_to budget_details_path
    else 
      redirect_to budget_details_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end
end
