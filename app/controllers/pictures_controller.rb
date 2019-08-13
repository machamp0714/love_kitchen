class PicturesController < ApplicationController
  def create
    article = Article.find(params[:picture][:article_id])
    @pictures = article.pictures

    if @pictures.size == MAX_UPLOAD_SIZE
      redirect_back fallback_location: request.referer, alert: '写真はこれ以上追加出来ません。'
    else
      @pictures.create(picture_param)
      respond_to do |format|
        format.html { redirect_back fallback_location: request.referer, notice: '写真が追加されました。' }
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
      format.html { redirect_back fallback_location: request.referer, notice: '写真は削除されました。' }
      format.js
    end
  end

  private

    def picture_param
      params.require(:picture).permit(:image)
    end
end
