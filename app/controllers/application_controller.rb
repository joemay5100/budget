class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user 

def current_user 
  @current_user ||= User.find(session[:user_id]) if session[:user_id] 
end

def current_budget
  current_user.budget
end

def require_user 
  redirect_to login_path unless current_user 
end

def login_user (user)
  session[:user_id] = user.id

  @session = Session.new
  @session.user_id = user.id
  @session.login_at = DateTime.now
  @session.save
end

def logout_user
  @user = current_user
  if @user
    @sessions = @user.sessions.where(logout_at: nil)
    logout_datetime = DateTime.now
    for @session in @sessions do
      @session.update(logout_at: logout_datetime)
    end
    session[:user_id] = nil 
  end
end

end
