class PagesController < ApplicationController
  def home
    articles = []
    User.joins(:articles).includes(:articles).order("articles.created_at DESC").each do |user|
      user.articles.each do |article|
        articles << article
      end
    end
    if user_signed_in?
      @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)
    else
      @articles = articles.first(20)
    end
  end

  def search
    @q = Article.search(search_params)
    @articles = @q.result.includes(:user).order("articles.created_at DESC").page(params[:page]).per(10)
  end

  private
    def search_params 
      params.require(:q).permit(:title_or_content_cont)
    end
end
