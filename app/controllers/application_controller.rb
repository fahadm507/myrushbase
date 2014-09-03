class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:location, :avatar, :name, :avatar, :category_id]
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :category_id, :location]
  end

  private

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def signed_in?
     current_user.present?
   end

   def set_current_user(user)
     session[:user_id] = user.id
   end

   def authenticate!
     unless signed_in?
       flash[:notice] = 'You need to sign in'
       redirect_to users_path
     end
   end

   helper_method :current_user
   helper_method :signed_in?
   helper_method :authenticate!
end
