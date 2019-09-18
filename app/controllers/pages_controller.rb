# frozen_string_literal: true

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
    @query = search_params[:title_or_content_cont]

    if @query.present? && @query.strip != ""
      session[:query] = search_params
    end

    if session[:query] && session[:query]["title_or_content_cont"] != ""
      articles = Article.ransack(session[:query]).result
    else
      articles = Article.ransack(search_params).result
    end

    if search_params[:like_order] == "checked"
      sql = "SELECT A.id, A.title, A.created_at, A.user_id, U.name, U.avatar, COUNT(L.article_id) AS 'likes' FROM articles AS A INNER JOIN users AS U ON A.user_id = U.id INNER JOIN likes AS L ON A.id = L.article_id GROUP BY L.article_id ORDER BY likes DESC"
      @results = articles.find_by_sql(sql)
    elsif search_params[:view_order] == "checked"
      @results = articles.includes(:user).order(view_count: :desc).page(params[:page]).per(10)
    else
      @results = articles.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  private
    def search_params
      params.require(:q).permit(:title_or_content_cont, :like_order, :view_order)
    end
end
