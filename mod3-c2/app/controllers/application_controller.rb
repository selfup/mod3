class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # passing controller and action
  def authorize!
    unless PermissionsService.new(current_user).allow?(params[:controller], params[:action])
      redirect_to root_url, danger: "Stranger Danger!"
  end
end
