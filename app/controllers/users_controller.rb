class UsersController < ApplicationController
  before_action :logout_user, only: [:new]

  def new
    @user = User.new
    render :layout => 'frontpage'
  end
  
  def create 
    @user = User.new(user_params) 
    
    @new_budget = Budget.new
    @new_budget.name = "test budget"
    @user.budget = @new_budget
    
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to budget_path 
    else 
      render 'new', :layout => 'frontpage'
    end 
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end
end
