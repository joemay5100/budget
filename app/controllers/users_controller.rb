class UsersController < ApplicationController
  before_action :logout_user, only: [:new]

  def new
    @user = User.new
    render :layout => 'frontpage'
  end
  
  def create 
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to '/budget' 
    else 
      render 'new', :layout => 'frontpage'
    end 
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end
end
