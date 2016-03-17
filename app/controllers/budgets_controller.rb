class BudgetsController < ApplicationController
  
  def new_user
    @user = User.new
  end
  
  def add_user
    @user = User.new(user_params) 
    @user.budget = current_user.budget
    
    if @user.save 
      redirect_to budget_path 
    else 
      render 'new_user'
    end
  end
  
  def list_users
    @users = current_user.budget.users
  end
  
  
  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end
end
