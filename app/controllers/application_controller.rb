class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    before_action :authenticate_user!
    # before_action :set_current_user

    # def set_current_user
    #     @current_user = User.find_by(id: params[:id])
    #     binding.pry
    # end

    # def authenticate_user
    #     if @current_user == nil
    #         binding.pry
    #         flash[:notice] = "ログインが必要です"
    #         redirect_to("/login")
    #     end
    # end

    def after_sign_in_path_for(resource)
        "/pages/index"
        # "/user/#{current_user.id}"
    end

    def after_sign_out_path_for(resource)
        "/pages/index"
    end

    def set_search
        @search = Room.ransack(params[:q])
        @results = @search.result
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
