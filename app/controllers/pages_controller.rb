class PagesController < ApplicationController
  def home
    articles = Article.includes(:pictures).includes(:user).order("articles.created_at DESC")
    if user_signed_in?
      @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)
    else
      @articles = articles.first(20)
    end
  end

  def about
    
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
