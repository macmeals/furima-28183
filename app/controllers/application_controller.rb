class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 
 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_kana, :first_kana, :birth_day ])
 end
end
