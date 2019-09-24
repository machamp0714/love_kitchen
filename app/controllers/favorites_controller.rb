# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :own_article?, only: [:create]

  def index
    @articles = []
    current_user.favorites.order("created_at DESC").each do |favorite|
      article = Article.find(favorite.article_id)
      @articles << article
    end
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
