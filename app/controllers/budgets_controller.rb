class BudgetsController < ApplicationController
  
  def new_user
    @user = User.new
  end
  
  def add_user
    if User.add_to_budget(user_params, current_budget) 
      redirect_to budget_path 
    else 
      render 'new_user'
    end
  end
  
  def show_details
    @budget = current_budget
    @users = User.where(budget: @budget, is_deleted: false)
    @deleted_users = User.where(budget: @budget, is_deleted: true)
  end
  
  def delete
  end
  
  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end
end
