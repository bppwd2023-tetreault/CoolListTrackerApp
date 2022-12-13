class ApplicationController < ActionController::Base
  before_action :sidebar_stuff
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization 

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def sidebar_stuff
    @past_items = Item.past_due
    @apr_items = Item.approaching_end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end
