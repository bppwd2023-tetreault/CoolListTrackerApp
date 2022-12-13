class ApplicationController < ActionController::Base
  before_action :approaching_items
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization 

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def approaching_items
    @apr_items = Item.where(deadline<DateTime.now+10.days)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end
