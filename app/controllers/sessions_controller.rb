class SessionsController < ApplicationController
  before_action :logout_user, only: [:new]
  
  def index
    @user = current_user
    # needs to change to all users on budget of user, not just this user
    @sessions = @user.sessions
  end
  
  def new
    render :layout => 'frontpage'
  end
  
  def create
    @user = User.find_by(email: params[:session][:email], is_deleted: false)
    if @user && @user.authenticate(params[:session][:password])
      login_user(@user)
      redirect_to budget_path
    else
      @wrong_credentials = true
      render 'new', :layout => 'frontpage'
    end 
  end
  
  def destroy 
    logout_user
    redirect_to root_path 
  end
end
