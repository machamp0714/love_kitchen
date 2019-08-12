class PicturesController < ApplicationController
  def create
  end

  def destroy
    @picture = Picture.find(params[:id])
    article = Article.find(@picture.article_id)
    @pictures = article.pictures
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_article_url(article), notice: '写真は削除されました。' }
      format.js
    end
  end
end
