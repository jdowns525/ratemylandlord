class ApplicationController < ActionController::Base
  before_action :load_current_user, :force_user_sign_in
  helper_method :current_user

  def load_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user
    @current_user
  end
  
  ALLOWED_PATHS_PATTERN = /\A\/(landlords(\/\d+)?|landlords\/?|support)?\z/.freeze
  
  def force_user_sign_in
    unless session[:user_id] || request.path.match?(ALLOWED_PATHS_PATTERN)
      redirect_to "/user_sign_in", alert: "You have to sign in first."
    end
  end  
end
