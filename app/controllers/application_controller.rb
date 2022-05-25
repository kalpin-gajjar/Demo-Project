class ApplicationController < ActionController::Base
    def after_sign_out_path_for(resource)
        new_user_session_path
    end

    def after_sign_in_path_for(resource)
        root_path
    end
    
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :user_name, :email, :password, pic: [], addresses_attributes: [:id, :address, :city, :state, :_destroy])}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :user_name, :email, :password, :current_password, pic: [], addresses_attributes: [:id, :address, :city, :state, :_destroy])}
        end
end
