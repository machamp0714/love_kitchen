class LikesController < ApplicationController
  def create
    current_user.likes.create(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
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
