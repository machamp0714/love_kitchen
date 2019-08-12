class PicturesController < ApplicationController
  def create
    article = Article.find(params[:picture][:article_id])
    article.pictures.create(picture_param)
    @pictures = article.pictures
    respond_to do |format|
      format.html { redirect_to pictures_article_url(article), notice: '写真が追加されました。' }
      format.js
    end
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

  private

    def picture_param
      params.require(:picture).permit(:image)
    end
end
