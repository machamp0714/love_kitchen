# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    articles = Article.with_user.with_pictures.order_by_created
    if user_signed_in?
      @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)

      @ranking = Article.order_by_likes_count.limit(10)
    else
      @articles = Article.with_user.with_pictures.order_by_created.limit(15)
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
      @results = articles.order_by_likes_count
    elsif search_params[:view_order] == "checked"
      @results = articles.with_user.order_by_views_count.page(params[:page]).per(10)
    else
      @results = articles.with_user.order_by_created.page(params[:page]).per(10)
    end
  end

  private
    def search_params
      params.require(:q).permit(:title_or_content_cont, :like_order, :view_order)
    end
end
