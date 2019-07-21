class PagesController < ApplicationController
  def home
    articles = Article.includes(:pictures).includes(:user).order("articles.created_at DESC")
    if user_signed_in?
      @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)
      sql = "SELECT A.id, A.title, A.created_at, A.user_id, U.name, U.avatar, COUNT(L.article_id) AS 'likes' FROM articles AS A INNER JOIN users AS U ON A.user_id = U.id INNER JOIN likes AS L ON A.id = L.article_id GROUP BY L.article_id ORDER BY likes DESC LIMIT 10;"
      @ranking = Article.find_by_sql(sql)
    else
      @articles = Article.includes(:user).includes(:pictures).order("created_at DESC").limit(15)
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
