class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :own_article?, only: [:create]

  def create
    current_user.likes.create(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
    @user = User.find(@article.user_id)
    @user.notifications.create(article_id: @article.id, like_user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @article = Article.find(@like.article_id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end
end
