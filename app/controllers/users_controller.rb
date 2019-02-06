class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def edit
        @user = current_user
    end

    def update_password
        @user = current_user
        if @user.update(user_params)
            bypass_sign_in(@user)
            redirect_to root_url, notice: "パスワードが変更されました。"
        else
            flash.now[:alert] = "入力に誤りがあります。"
            render :edit
        end
    end

    private

        def user_params
            params.require(:user).permit(:password, :password_confirmation)
        end
end
