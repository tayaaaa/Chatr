class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pundit
    protect_from_forgery

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
    def user_not_authorized
        render 'layouts/pundit_error'
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
    end
    
    def after_sign_in_path_for(resource)
        if current_user.profile == nil
            new_profile_path
        else
            '/browse'
        end
    end

    def after_sign_out_path_for(resource)
        '/'
    end
end
