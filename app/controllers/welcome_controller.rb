class WelcomeController < ApplicationController
  before_action :require_user, only: [:budget]

  def home
    redirect_to budget_path if current_user
    render :layout => 'frontpage'
  end
  
  def budget 
  end
end
