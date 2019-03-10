class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    current_user.favorites.create(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @article = Article.find(@favorite.article_id)
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end
end
