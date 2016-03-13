class SessionsController < ApplicationController
  before_action :logout_user, only: [:new]

  def new
    render :layout => 'frontpage'
  end
  
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to budget_path
    else
      @wrong_credentials = true
      render 'new'
    end 
  end
  
  def destroy 
    logout_user
    redirect_to root_path 
  end
end
