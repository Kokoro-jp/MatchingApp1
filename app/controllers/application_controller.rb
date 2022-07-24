class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search

    #signin後の画面遷移先を指定。user profile詳細画面へ遷移予定。
    def after_sign_in_path_for(resource)
        "/pages/index"
        # "/user/#{current_user.id}"
    end

    def set_search
        @search = Room.ransack(params[:q])
        @results = @search.result
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
