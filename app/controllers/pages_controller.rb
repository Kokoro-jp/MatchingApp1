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

end
