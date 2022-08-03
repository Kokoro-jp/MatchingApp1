class PagesController < ApplicationController
    #user profile 詳細画面のアクセス権限
    before_action :authenticate_user!, only: :show
    #Toppage を表示するアクション
    def index
    end

    #User profile 詳細を表示するアクション
    def show
        @user = current_user
    end

   # 個人Profileの編集アクション
    # def edit
    #     @user = current_user
    # end

    # def update
    #     @user = current_user
    #     if @user.update(params.require(:user).permit(:name, :img, :introduction))
    #         flash[:notice]= "updated an account!!"
    #         redirect_to "http://localhost:3000/"
    #     else
    #         render "edit"
    #     end
    # end
end
