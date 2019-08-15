# frozen_string_literal: true

class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :have_a_permission_to_create, only: [:create]
  before_action :have_a_permission_to_delete, only: [:destroy]

  def create
    article = Article.find(params[:picture][:article_id])
    @pictures = article.pictures

    if @pictures.size == MAX_UPLOAD_SIZE
      redirect_back fallback_location: request.referrer, alert: "写真はこれ以上追加出来ません。"
    else
      @pictures.create(picture_param)
      respond_to do |format|
        format.html { redirect_back fallback_location: request.referrer, notice: "写真が追加されました。" }
        format.js
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    article = Article.find(@picture.article_id)
    @pictures = article.pictures
    @picture.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: request.referrer, notice: "写真は削除されました。" }
      format.js
    end
  end

  private

    def picture_param
      params.require(:picture).permit(:image)
    end

    def have_a_permission_to_create
      article = current_user.articles.find_by(id: params[:picture][:article_id])
      redirect_to root_url, alert: "あなたに権限はありません。" if article.nil?
    end

    def have_a_permission_to_delete
      picture = Picture.find(params[:id])
      article = current_user.articles.find_by(id: picture.article_id)
      redirect_to root_url, alert: "あなたに権限はありません。" if article.nil?
    end
end
