class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  # protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_current_user

  def set_current_user
    User.current = current_user
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
