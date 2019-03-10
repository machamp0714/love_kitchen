class FavoritesController < ApplicationController
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
  end
end
