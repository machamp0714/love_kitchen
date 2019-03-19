class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update_password, :following]

    def show
        @user = User.friendly.find(params[:id])
        @articles = @user.articles.order(created_at: :desc)
        @liked_articles = []
        @user.likes.includes(:article).order(created_at: :desc).each do |like|
            article = Article.find(like.article_id)
            @liked_articles << article
        end
        @feed = @user.feed
    end
    
    def edit
        @user = current_user
    end

    def following
        @user = User.find_by(name: params[:id])
        @following_user = @user.following
    end

    def followers
        @user = User.find_by(name: params[:id])
        @followers_user = @user.followers
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
